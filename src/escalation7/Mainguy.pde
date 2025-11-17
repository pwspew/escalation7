// Madeline H fabricated this class
class Mainguy {
  PVector position, volocity;
  int health, x, y, speed;
  boolean moveL, moveR, moveU, moveD;
  PImage ServantL;
 
  //Constructor
  Mainguy() {
    x = width/2;
    y = height/2;
    health = 1;
    speed = 5;
    moveL = false;
    moveR = false;
    moveU = false;
    moveD = false;
    ServantL = loadImage ("ServantL");
  }
  
  void display() {
    //image(ServantL, x, y);
    rect(x, y, 20, 20);
  }
  
  void jump() {
    
  }
  
  //Cred: Chris Whitmire Lessons
  //Vid: Getting a Player to move Left and Right in Processing (v=jgr31WIYWdk)
  void move() {
    if (moveL == true) {
      x -= speed;
    }
    if (moveR == true) {
      x += speed;
    }
    if (moveU == true) {
      y -= speed;
    }
    if (moveD == true) {
      y += speed;
    }
  }
  
  void attack() {
    
  }
  
  void intersect() {
    
  }
  
}
