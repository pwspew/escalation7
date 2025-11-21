//Ethan Shafran made this class

class Obstacle {
  int py;
  PImage img;
  float x, y;
  float w, h;
  // Constructor - takes a PImage and a position
  Obstacle(PImage tempImg, float tempX, float tempY) {
    img = tempImg;
    x = tempX;
    y = tempY;
    if (img != null) {
      w = img.width;
      h = img.height;
    } else {
      w = 50;
      h = 50;
    }
  }

  // Display the obstacle
  void display() {
    if (img != null) {
      image(img, x, y);
    } else {
      fill(255, 0, 0);
    }
  }

  // Optional: basic collision check with a point or rectangle
  boolean collides (float px, float pu, float pw, float ph) {
    return px < x + w && px + pw > x && py < y + h && py + ph > y;
  }
}
