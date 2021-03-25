boolean checkOutOfBounds(){return (areTheNumbersBad() || situationIsBad());}
void newPos()
{
  println("numIt"+numIt);
  set(wPos,hPos, color(map(iterationSum/ipp,0,10000,0,255),0,0));
  a = map(wPos,0,width,-0.01,0.01);
  b = map(hPos,0,height,-0.01,0.01);
  x = random(70); //<>//
  y = random(70);
  z = random(70);
  dx = 0.01;
  dy = 0.01;
  dz = 0.01;
  numIt = 0;
  
}

boolean situationIsBad() {
  return keyPressed|| numIt == 10000;
}

boolean areTheNumbersBad() {
  //println(x+" "+y+" "+z+" "+dx+" "+dy+" "+dz);
  return abs(x) > width*5 || abs(y) > height*5 || abs(z) > 5*height|| sqrt(pow(dx, 2)+pow(dy, 2)+pow(dz, 2)) < 5*pow(10, -4);
}
