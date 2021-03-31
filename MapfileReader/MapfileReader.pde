 //<>//
import java.io.FileWriter;
import java.io.*;

BufferedReader reader;
String text;
String  [][]newLines;
int i=0;


void setup()
{
  noFill();
  reader = createReader("C:/Users/Michel/Desktop/Processing21_22/Lorenz/mapValues.txt");
  readFile();
  background(0x00);
  stroke(0xff);
  size(1000, 1000);
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
