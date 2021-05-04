Raum raum = new Raum();
Staubi s = new Staubi(300,200,raum);

void setup()
{
  size(600,400);
  background(200);
  raum.zeichnen();
}

void draw()
{
   s.bewegen();
   s.zeichnen();
}
