void readFile() //<>//
{  
  try {

    text = reader.readLine();
  }
  catch (IOException e) {
    e.printStackTrace();
    text = null;
    println("error?");
  }

  do
  {
    newLines[i] = (split(text, ";"));
    try {

      text = reader.readLine();
    }
    catch (IOException e) {
      e.printStackTrace();
      text = null;
      println("error?");
    }
    print("#");
    i++;
  }
  while (text != null);
  println("done!");
}

void drawBody()
{
  pushMatrix();
  translate(width/2-200, height/2-200);
  for (int i=0; i< newLines.length; i++)
  {
    for (int j=0; j <newLines[i].length; j+= 3)

    {
      stroke(newLines[i+2], (float)newLines[i+2]);
      point(newLines[i], newLines[i+1], newLines[i+2]);
    }
  }

  popMatrix();
  println("next gen");
}
