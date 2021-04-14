boolean checkOutOfBounds() { //<>// //<>// //<>// //<>//
  return (areTheNumbersBad() || situationIsBad());
}
void newPos()
{
  if (iterationSum/ipp > maxNumIt* acceptableFactor)
    set(wPos, hPos, color(map(iterationSum/ipp, 0, maxNumIt, 0, 255), map(iterationSum/ipp, 0, maxNumIt, 0, 255)));
  a = map(wPos, 0, width, lowerA, upperA);
  b = map(hPos, 0, height, lowerB, upperB);
  x = 5+cci;
  y = 5+cci;
  z = 5+cci;
  dx = 0.01;
  dy = 0.01;
  dz = 0.01;
  numIt = 0;
}


void appendFile()
{
  try {
    File file =new File("../mapValues.txt");

    if (!file.exists()) {
      file.createNewFile();
    }
    FileWriter fw = new FileWriter(file, true);///true = append
    BufferedWriter bw = new BufferedWriter(fw);
    PrintWriter pw = new PrintWriter(bw);
    for (int i=0; i < width; i++)
    {
      for (int j=0; j< height; j++)
      {
        if (values[i][j] > map(iterationSum/ipp*acceptableFactor, 0, maxNumIt, 0, 255))
        {
          pw.write(i+";");
          pw.write(j+";");
          pw.write(values[i][j]+";");
        }
      }
    }

    pw.write("\n");
    pw.close();
    println("done!"+c);
  }
  catch (Exception e) {
    println(e);
  }
}

boolean situationIsBad() {
  return numIt == 10000;
}

boolean areTheNumbersBad() {
  //println(x+" "+y+" "+z+" "+dx+" "+dy+" "+dz);
  return abs(x) > width*5 || abs(y) > height*5 || abs(z) > 5*height||Float.isNaN(a)||Float.isNaN(b)||Float.isNaN(c)|| sqrt(pow(dx, 2)+pow(dy, 2)+pow(dz, 2)) < 5*pow(10, -3);
}
