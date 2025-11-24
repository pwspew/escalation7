class Item {
  float x, y;
  float size = 14;
  int value = 5;

  Item(float sx, float sy) {
    x = sx;
    y = sy;
    value = 5 + int(random(0, 6));
  }

  void display() {
    noStroke();
    fill(100, 255, 120);
    rectMode(CENTER);
    rect(x, y, size, size);
    rectMode(CORNER);
  }
}
