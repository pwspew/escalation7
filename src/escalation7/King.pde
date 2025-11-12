//Ellie Jacobsen (she also made the cool king art)
class King {
  int x, y;
  tx = int(random(width));
  ty = int(random(height));
  PImage king;
  
  void King() {
    x=10;
    y=10;
    king = loadImage("king.png");
  }

  void display() {
    image(king, x, y);
  }
  void move() {
  float d = dist(x, y, tx, ty);
  if (tw<1) {
    gameOver();
  }
  println(d);
  }
}
