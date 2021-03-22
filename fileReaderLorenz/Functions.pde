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
{  try {
    text = reader.readLine();
  }
  catch (IOException e) {
    e.printStackTrace();
    text = null;
  }
  if (text == null) {
    // Stop reading because of an error or file is empty
    noLoop();
  } else {
    String[] pieces = split(text, ";");
    x = random(-3, 3);
    y = random(-3, 3);
    z = random(-3, 3);
    a = Float.parseFloat(pieces[0]);
    b = Float.parseFloat(pieces[1]);
    c = Float.parseFloat(pieces[2]);

    println("a:"+a+" b:"+b+" c:"+c);
    dx=random(-0.01, 0.01);
    dy=random(-0.01, 0.01);
    dz=random(-0.01, 0.01);
  }
}


boolean situationIsBad() {
  return mousePressed;
}

boolean areTheNumbersBad() {
  //println(x+" "+y+" "+z+" "+dx+" "+dy+" "+dz);
  return abs(x) > width*10 || abs(y) > height*10 || abs(z) > 10*height|| sqrt(pow(dx, 2)+pow(dy, 2)+pow(dz, 2)) < 5*pow(10, -3);
}
