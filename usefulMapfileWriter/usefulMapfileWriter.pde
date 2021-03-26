import java.io.FileWriter; //<>//
import java.io.*;

float x, y, z;
float dx, dy, dz, dt;
float a, b, c;
int hPos, wPos, numIt;
int cci;// current count of iteration
int iterationSum;
float step;

//play around vars
int maxNumIt = 1000;
float acceptableFactor = 0.00;
String[][] values;

float lowerEnd = -1,
upperEnd = 99;
//optional? keep them to the normal boundaries
float lowerA = -10,
upperA = 500-lowerA;

float lowerB = -50,
upperB = 70;
int ipp= 5;//iterations per position



void setup()
{
  values = new String[1000][1000];
  newPos();
  x = 0.01;
  y = 0.1;
  z = 0.5;
  a = 11/2;
  b = 35;
  c = lowerEnd;
  background(0x00);
  stroke(0xff);
  size(1000, 1000);
  strokeWeight(0.9);
  dt = 0.005;
  step = (upperEnd-lowerEnd)/width;
}

void draw()
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
      if (iterationSum/ipp > maxNumIt * acceptableFactor) values[wPos][hPos] = Float.toString((float)Math.round(map(((float)iterationSum/ipp), 0, maxNumIt, 0, 255)*100)/100)+";";
      else values [wPos][hPos] = "0;";
      cci = 0;
      wPos++;
      newPos();
      iterationSum= 0;
    }
    wPos =0;
    hPos++;
  }
  c += step;
  if (c > upperEnd) noLoop();
  appendFile();
}
