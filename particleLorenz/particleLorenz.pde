import java.io.FileWriter;
import java.io.*;


float a, b, c;
int lastFrameCount;
FileWriter fw;
BufferedWriter bw;
BufferedReader reader;
String text;
Particle particles[] = new Particle[1];

void setup()
{
  //reader
  reader = createReader("C:/Users/Michel/Desktop/Processing21_22/Lorenz/values.txt");
  newPos();
  background(0x00);
  stroke(0xff);
  size(800, 800, P3D);
  strokeWeight(5);
  frameRate(1);
  noFill();
  lastFrameCount =0;
  for (int i=0; i< particles.length; i++)
  {
    particles[i] = new Particle();
  }
}

void draw()
{
  
  pushMatrix();
  translate(width/3, height, 0);
  for (int i=0; i < particles.length; i++)
  {
      particles[i].move();
      particles[i].paint();
  }
  popMatrix();

 /* camera(
    2 * width * cos(map(frameCount%1000, 0, 1000, 0, TWO_PI)), 
    height*noise(frameCount / 10000), 
    2 * (height) / tan(PI*30.0 / 180.0)*sin(map(frameCount%1000, 0, 1000, 0, TWO_PI)), 

    width/2, height/2, 23, 
    0, 1, 0);*/
}
