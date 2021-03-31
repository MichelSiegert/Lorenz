 //<>//
import java.io.FileWriter;
import java.io.*;

BufferedReader reader;
String text;
int  [][]newLines = new int[401][166912];
int i=0;


void setup()
{
  noFill();
  reader = createReader("../mapValues.txt");
  readFile();
  background(0x00);
  stroke(0xff);
  size(1000, 1000, P3D);
  strokeWeight(1);
}

void draw()
{ 
  background(0x00);
  camera(width*cos(map(frameCount%10,0,10,0,TWO_PI)), 
    height*sin(PI/2), 
    height*sin(map(frameCount%10,0,10,0,TWO_PI)), 

    width/2, 
    height/2, 
    50, 
    0, 1, 0);
  drawBody();
}
