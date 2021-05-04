class Staubi
{
  PVector pos;  // Ort des Staubis
  PVector v;    // Bewegungsrichtung des Staubis 
  float vBetrag = 3; // Betrag der Geschwindigkeit

  Raum raum;    // Der Raum, den der Staubi saubermachen soll

  String modus = "zufall";  // Der Modus, in dem sich der Staubsauger gerade befindet
  
  // Einstellungen für den Kreiselmodus
  float r = 0;
  float s = 1;
  // Timer für Zufallsmodus
  int zaehler = 0;
  int max = 500;

  // Konstruktor
  public Staubi(float x, float y, Raum raum_)
  {
    raum = raum_;
    pos = new PVector(x, y);
    v = new PVector(vBetrag, 0);    
  }
  
  // Methoden
  void bewegen()
  {
    if (modus.equals("zufall"))
    {
      if (!istWand())
      {
        geradeFahren();
      } else
      {
        neueZufallsrichtung();
      }
      zaehler++;
      if (zaehler == max)
      {
        wechsleInKreiselmodus();
      }
    }
    
    if (modus.equals("kreisel"))
    {
      if (!istWand())
      {
        spiraleFahren();
        
      } else
      {
        wechsleInZufallsmodus();
      }
    }
  }
  
  void wechsleInKreiselmodus()
  {
    modus = "kreisel";
    r = 0;
    s = 1;
  }
  
  void wechsleInZufallsmodus()
  {
    modus = "zufall";
    zaehler = 0;
  }

  void zeichnen()
  {
    ellipseMode(CENTER);
    fill(255, 0, 0);
    strokeWeight(1);
    ellipse(pos.x, pos.y, 30, 30);
  }


//----------  Alles unter dieser Linie ist für die Aufgabe nicht relevant -----
  // Überprüft ob vor ihm eine Wand ist
  private boolean istWand()
  { 
    PVector richtung = PVector.mult(v, 15);
    PVector neuePos = PVector.add(pos, richtung); 
    if (raum.innen(neuePos.x, neuePos.y))
    {
      return false;
    } else
    {
      return true;
    }
  }
  // Wählt eine neue Zufallsrichtung 
  private void neueZufallsrichtung()
  {
    v = PVector.random2D().mult(vBetrag);
  }

  // Staubi fährt ein Stück geradeaus
  private void geradeFahren()
  {
    pos.add(v);
  }
  
  // Staubi fährt eine Spirale
  private void spiraleFahren()
  {
    if (r < s)
        {
          pos.add(v);
          r++;
        } else {
          r = 0;
          s = s + 0.2;
          v.rotate(0.3);
        }
  }
}
