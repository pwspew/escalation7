class Button {
  String label;
  float x, y, w, h;
  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    fill(0);
    rectMode(CENTER);
    noStroke();
    rect(x, y, w, h);

    fill(255);
    textAlign(CENTER);
    textSize(16);
    text(label, x+ w/2, y+h/2);
  }


  boolean clicked() {
    return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}
