import java.io.FileWriter;
import java.io.*;


float a, b, c;
int lastFrameCount;
FileWriter fw;
BufferedWriter bw;
BufferedReader reader;
String text;
Particle particles[] = new Particle[50];

void setup()
{
  //reader
  
  for (int i=0; i< particles.length; i++)
  {
    particles[i] = new Particle();
  }
  reader = createReader("C:/Users/Michel/Desktop/Processing21_22/Lorenz/values.txt");
  newPos();
  background(0x00);
  stroke(0xff);
  size(800, 800, P3D);
  strokeWeight(0.5);
  frameRate(20);
  noFill();
  lastFrameCount =0;
}

void draw()
{
  background(0x00);
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i=0; i < particles.length; i++)
  {
    particles[i].move();
    particles[i].paint();
  }
  popMatrix();

  camera(
    (3/2)* width * cos(map(frameCount%1000 , 0, 1000, 0, TWO_PI)), 
    (3/2)* height * noise ( frameCount / 10000), 
    (height) / tan(PI*30.0 / 180.0)*sin(map(frameCount%1000, 0, 1000, 0, TWO_PI)), 

    width/2, height/2, 23, 
    0, 1, 0);
}

void mouseClicked() {
  newPos();
}
