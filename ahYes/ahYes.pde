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

  dx = a*(y-x)*dt;
  dy = (x*(b-z)-y)*dt;
  dz = (x*y-c*z)*dt;
  println(x+" "+ y+" "+z);

  x += dx;
  y += dy;
  z += dz;
  pushMatrix();
  translate(width/2, height/2, 0);
  vector.add(new PVector(x, y, z));
  beginShape();
  for (int i=0; i < vector.size(); i++)
  {
    vertex(map(vector.get(i).x, -50, 50, -width/2, width/2), map(vector.get(i).y, -50, 50, -height/2, height/2), map(vector.get(i).z, -50, 50, -height/2, height/2));
  }
  endShape();
  popMatrix();
}
