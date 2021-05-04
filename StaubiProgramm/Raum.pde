class Raum
{
  int links = 10;
  int rechts = 590;
  int oben = 10;
  int unten = 390;
  
  public boolean innen(float x, float y)
  {
    if (x > links && x < rechts)
    {
      if(y > oben && y < unten)
      {
        return true;
      }
    }
    return false;
  }
  
  public void zeichnen()
  {
    stroke(10);
    strokeWeight(5);
    noFill();
    rect(links,oben,rechts-links, unten-oben);
  }
    
}
