class Particle
{
  float x, y, z;
  float [][] oldVal = new float[10][3];
  float dx, dy, dz, dt;
  color col;

  Particle()
  {
    newVal();
    col =color(random(128, 255), random(128, 255), random(128, 255));
    for (int i=0; i<oldVal.length; i++)
    {
      for (int j=0; j<oldVal[i].length; j++)
      {
        oldVal[i][j]=0;
      }
    }
  }

  void move()
  {
    dx = a*(y-x)*dt;
    dy = (x*(b-z)-y)*dt;
    dz = (x*y-c*z)*dt;
    if (areTheNumbersBad(x, y, z, dx, dy, dz)) newVal();

    x += dx;
    y += dy;
    z += dz;
    for (int i=(oldVal.length)-1; i>0; i--)
    {
      oldVal[i][0]=oldVal[i-1][0];
      oldVal[i][1]=oldVal[i-1][1];
      oldVal[i][2]=oldVal[i-1][2];
    }

    oldVal[0][0]=x;
    oldVal[0][1]=y;
    oldVal[0][2]=z;
  }
  void paint()
  {
    stroke(col);
    beginShape();
    vertex(x, y, z);
    for (int i=0; i<oldVal.length; i++)
    {
      vertex(oldVal[i][0], oldVal[i][1], oldVal[i][2]);
    }
    endShape();
  }
  void newVal()
  {
    x = (random(-width/2, width/2)); 
    y = (random(-width/2, width/2));
    z = (random(-width/2, width/2));
    dx=0;
    dy=0;
    dz=0;
    dt = random(0.0005, 0.001);
  }
}
