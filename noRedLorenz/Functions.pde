void checkOutOfBounds()
{
  if (areTheNumbersBad() || situationIsBad())
  {
      println("check");
      vector.clear();
      newPos();
  }
}
void newPos()
{
  x = random(-30, 30);
  y = random(-30, 30);
  z = random(-30, 30);
  a= random(-20, 20); 
  b= random(-30, 30);
  c = random(-5, 5);
  dx=random(-0.01,0.01);
  dy=random(-0.01,0.01);
  dz=random(-0.01,0.01);
  lastFrameCount = frameCount;
}



void appendVar(String type)
{
  try {
    File file =new File("/Users/Michel/Desktop/Processing21_22/Lorenz/values.txt");
    //chemin = dataPath;
    // positions.txt== your file;

    if (!file.exists()) {
      file.createNewFile();
    }
    FileWriter fw = new FileWriter(file, true);///true = append
    BufferedWriter bw = new BufferedWriter(fw);
    PrintWriter pw = new PrintWriter(bw);

    pw.write(a+";"+b+";"+c+";"+type+"\n");
    pw.close();
    println("printworked");
  }
  catch (Exception e) {
    println(e);
  }
}

boolean situationIsBad() {return keyPressed;}

boolean areTheNumbersBad() {
//println(x+" "+y+" "+z+" "+dx+" "+dy+" "+dz);
return abs(x) > width*10 || abs(y) > height*10 || abs(z) > 10*height|| sqrt(pow(dx, 2)+pow(dy, 2)+pow(dz, 2)) < 5*pow(10, -3);}
