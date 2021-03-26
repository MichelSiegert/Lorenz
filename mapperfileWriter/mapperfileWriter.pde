import java.io.FileWriter; //<>//
import java.io.*;

float x, y, z;
float dx, dy, dz, dt;
float a, b, c;
int hPos, wPos, numIt;
int cci;// current count of iteration
int ipp= 50;//iterations per position
int iterationSum;
String[][] values;
int range = 10000;

void setup()
{
  values = new String[400][400];
  newPos();
  x = 0.01;
  y = 0.1;
  z = 0.5;
  a = 11/2;
  b = 35;
  c = -5;
  background(0x00);
  stroke(0xff);
  size(400, 400);
  strokeWeight(0.9);
  dt = 0.005;
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
        while (numIt < 10000)
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
      }
      values[wPos][hPos] = Float.toString((float)Math.round(map(((float)iterationSum/ipp), 0, 10000, 0, 255)*100)/100)+";";
      cci = 0;
      wPos++;
      newPos();
      iterationSum= 0;
    }
    wPos =0;
    hPos++;
  }
  c += range/width;
  println("done");
  if(c > range/2) noLoop();
  appendFile();
}
