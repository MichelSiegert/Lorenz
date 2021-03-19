float x, y, z;
float dx, dy, dz, dt;
float a, b, c;
ArrayList<PVector> vector;
void setup()
{
  x = 0.01;
  y = 0.1;
  z = 0.5;
  a=25/2; 
  b=35;  
  c= 17/5;
  background(0x00);
  stroke(0xff);
  size(800, 800, P3D);
  strokeWeight(0.9);
  noFill();
  dt = 0.005;
  vector = new ArrayList<PVector>();
}

void draw()
{
  background(0x00);

  dx = a*(y-x)*dt;
  dy = (x*(b-z)-y)*dt;
  dz = (x*y-c*z)*dt;
  println(x+" "+ y+" "+z);

  x += dx;
  y += dy;
  z += dz;
  pushMatrix();
  translate(width/3, height/3*2, 0);
  vector.add(new PVector(x, y, z));
  beginShape();
  for (int i=0; i < vector.size(); i++)
  {
    vertex(map(vector.get(i).x, -5, 50, -width/2, width/2), map(vector.get(i).y, -5, 50, -height/2, height/2), map(vector.get(i).z, -5, 50, -height/2, height/2));
  }
  endShape();
  popMatrix();
  camera(width*cos(map(frameCount%1000, 0, 1000, 0, TWO_PI)), height*noise(frameCount/10000), (height) / tan(PI*30.0 / 180.0)*sin(map(frameCount%1000, 0, 1000, 0, TWO_PI)), 
    width/2, height/2, 0, 
    0, 1, 0);
}
