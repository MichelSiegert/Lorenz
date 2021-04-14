import java.io.FileWriter; //<>//
import java.io.*;

float x, y, z;
float dx, dy, dz, dt, da, db;
float a, b, c;
int hPos, wPos, numIt;
int cci;// current count of iteration
int iterationSum;
float step;
ArrayList<PVector> vector;

//play around vars
int maxNumIt = 1000;
float acceptableFactor = 0.9;
int [][] values;
int lastFrameCount;

//optional? keep them to the normal boundaries
float lowerA = -500, 
  upperA = 0-lowerA;

float lowerB = -500, 
  upperB = 500-lowerB;
int ipp= 5;//iterations per pixel

boolean imageIsDone = true;
boolean noneIsPicked = true;
boolean oneIsPicked = false;
boolean isDoneMapping = false;
PVector p1, p2, p3;



void setup()
{
  values = new int[400][400];
  newPos();
  x = 0.01;
  y = 0.1;
  z = 0.5;
  a = 11/2;
  b = 35;
  c = 400;
  background(0x00);
  stroke(0xff);
  size(400, 400, P3D);
  strokeWeight(0.9);
  dt = 0.005;
  lastFrameCount =0;
  vector = new ArrayList<PVector>();
}

void draw()  
{
  if (imageIsDone && noneIsPicked && !isDoneMapping)
  {
    background(0x00);
    hPos=0;
    while (hPos < height)
    {
      if (hPos%(height/10)==0 && hPos > 0) print("#");
      wPos =0;
      while (wPos<width)
      {
        while (cci < ipp)
        {
          while (numIt < maxNumIt)
          {
            dx = a*(y-x)*dt;
            dy = (x*(b-z)-y)*dt;
            dz = (x*y-c*z)*dt;
            x += dx;
            y += dy;
            z += dz;
            if (checkOutOfBounds())break;
            numIt++;
          }
          cci++;
          iterationSum += numIt;
          numIt=0;
        }
        if (iterationSum/ipp > maxNumIt * acceptableFactor) values[wPos][hPos] = (int)map(((float)iterationSum/ipp), 0, maxNumIt, 0, 255);
        else values [wPos][hPos] = 0;
        cci = 0;
        wPos++;
        newPos();
        iterationSum= 0;
      }
      wPos =0;
      hPos++;
    }
    isDoneMapping = true;
  } else if (!imageIsDone)
  {
    background(0x00);
    dx = a*(y-x)*dt;
    dy = (x*(b-z)-y)*dt;
    dz = (x*y-c*z)*dt;
    checkOutOfBounds();

    x += dx;
    y += dy;
    z += dz;
    pushMatrix();
    translate(width/3, height, 0);
    vector.add(new PVector(x, y, z));
    beginShape();
    for (int i=0; i < vector.size(); i++)
    {
      stroke(
        0, 
        abs(2*sin(map(frameCount%10000, 0, 10000, 0, TWO_PI))*(255-(i*5)))%256, 
        map(i, 0, vector.size(), 0, 255));

      vertex(
        map(vector.get(i).x, -5, 50, -width/2, width/2), 
        map(vector.get(i).y, -5, 50, -height/2, height/2), 
        map(vector.get(i).z, -5, 50, -height/2, height/2));
    }
    endShape();
    popMatrix();

    if (lastFrameCount+10000 < frameCount)
    {
      println("looks decently stable!");
      newActualPos();
    }

    camera(
      2 * width * cos(map(frameCount%1000, 0, 1000, 0, TWO_PI)), 
      height*noise(frameCount / 10000), 
      2 * (height) / tan(PI*30.0 / 180.0)*sin(map(frameCount%1000, 0, 1000, 0, TWO_PI)), 

      width/2, height/2, 23, 
      0, 1, 0);
  }
}


void mouseClicked()
{
  if (imageIsDone && noneIsPicked)
  {
    p1 =  new PVector(mouseX, mouseY);
    oneIsPicked = true;
    noneIsPicked = false;
    println("point1  selected!");
  } else if ( imageIsDone && oneIsPicked)
  {
    p2 =  new PVector(mouseX, mouseY);
    oneIsPicked = false;
    imageIsDone = false;
    println("point2  selected!");
    getDelta();
  }
}
