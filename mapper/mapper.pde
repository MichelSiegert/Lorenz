import java.io.FileWriter; //<>//
import java.io.*;

float x, y, z;
float dx, dy, dz, dt;
float a, b, c;
int hPos, wPos, numIt;
int cci;// current count of iteration
int ipp= 1;//iterations per position
int iterationSum;

void setup()
{
  newPos();
  x = 0.01;
  y = 0.1;
  z = 0.5;
  a = 11/2;
  b = 35;
  c = random(0.01);
  background(0x00);
  stroke(0xff);
  size(800, 800, P3D);
  strokeWeight(0.9);
  noFill();
  dt = 0.005;
  noLoop();
}

void draw()
{
  while (hPos < height)
  {
    if(hPos%(height/10)==0 && hPos > 0) print("#");
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
      cci = 0;
      wPos++;
      newPos();
      iterationSum= 0;
    }
    wPos =0;
    hPos++;
  }
}
