void readFile() //<>//
{  
  try {text = reader.readLine();}catch (IOException e) {} //<>//
  do
  {
    String [] seperated = (split(text, ";"));
    println(seperated.length);
    for (int j=0; j<seperated.length-1; j++)
    {
      newLines[i][j] = Integer.parseInt(seperated[j]);
    }
    try {text = reader.readLine();}catch (IOException e) {}
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
    for (int j=0; j <newLines[i].length-3; j+= 3)
    {
      if (newLines[i][j] == 0) break;
      stroke(newLines[i][j+2],newLines[i][j+2]);
      point(newLines[i][j],newLines[i][j+1], newLines[i][j+2]);
    }
    if( i%(newLines.length/10)==0)print("#");
  }

  popMatrix();
  println("next gen");
}
