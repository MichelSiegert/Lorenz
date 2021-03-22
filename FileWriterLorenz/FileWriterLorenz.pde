import java.io.FileWriter;
import java.io.*;
int fCount, sCount;
float x, y, z;
float dx, dy, dz, dt;
float a, b, c;
int iterationCount = 0;
ArrayList<PVector> vector;
int lastFrameCount;
FileWriter fw;
BufferedWriter bw;
void setup()
{
  fCount=0;
  sCount=0;
  newPos();
  background(0x00);
  stroke(0xff);
  size(800, 800, P3D);
  strokeWeight(0.9);
  noFill();
  dt = 0.005;
  vector = new ArrayList<PVector>();
  lastFrameCount =0;
}

void draw()
{
  background(0x00);
  iterationCount=0;
  newPos();
  while (iterationCount<10000) {
    dx = a*(y-x)*dt;
    dy = (x*(b-z)-y)*dt;
    dz = (x*y-c*z)*dt;
    if (areTheNumbersBad())
    {
      println("fail");
      fCount++;
      break;
    }

    x += dx;
    y += dy;
    z += dz;
    iterationCount++;
    if (iterationCount ==10000)
    {
      println("success!");
      appendVar("a");
      sCount++;
    }
    text("success: "+sCount, 200, 200);
    text("fail: "+fCount, 200, 400);
    text("ratio: "+(float)Math.round((float)sCount/fCount*100*100)/100, 200, 600);
  }
}



void mouseClicked() { // Press a key to save the data
  appendVar("m");
}
