 //<>//
import java.io.FileWriter;
import java.io.*;

BufferedReader reader;
String text;
int  [][]newLines = new int[401][16000];
int i=0;


void setup()
{
  noFill();
  reader = createReader("/../mapValues.txt");
  readFile();
  background(0x00);
  stroke(0xff);
  size(1000, 1000, P3D);
  strokeWeight(1);
}

void draw()
{ 
  camera(2*width*cos(PI/2), 
    2*height*sin(PI/2), 
    2*height/ tan(PI/6)*cos(PI/2), 

    width/2, 
    height/2, 
    50, 
    0, 1, 0);
  drawBody();
}
