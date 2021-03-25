boolean checkOutOfBounds() { //<>//
  return (areTheNumbersBad() || situationIsBad());
}
void newPos()
{
  set(wPos, hPos, color(map(iterationSum/ipp, 0, 10000, 0, 255),0, 0));
  a = map(wPos, 0, width, 0, 1);
  b = map(hPos, 0, height, 0, 1);
  x = 5+cci;
  y = 5+cci;
  z = 5+cci;
  dx = 0.01;
  dy = 0.01;
  dz = 0.01;
  numIt = 0;
}

boolean situationIsBad() {
  return numIt == 10000;
}

boolean areTheNumbersBad() {
  //println(x+" "+y+" "+z+" "+dx+" "+dy+" "+dz);
  return abs(x) > width*5 || abs(y) > height*5 || abs(z) > 5*height|| sqrt(pow(dx, 2)+pow(dy, 2)+pow(dz, 2)) < 5*pow(10, -4);
}
