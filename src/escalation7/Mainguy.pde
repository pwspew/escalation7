// Madeline H fabricated this class
class Mainguy {
  PVector position, volocity;
  int health, x, y, w, h, basespeed, size, currentspeed;
  boolean moveL, moveR, moveU, moveD;
  PImage ServantL;
 
  //Constructor
  Mainguy() {
    x = width/2;
    y = height/2;
    w = 10;
    h = 10;
    size = w+h/2;
    health = 1;  
    basespeed = 100;
    moveL = false;
    moveR = false;
    moveU = false;
    moveD = false;
    ServantL = loadImage ("ServantL");
    currentspeed = basespeed / size;
    
  }
  
  void display() {
  rect(x, y, 20, 20);
  }
  
  void jump() {
    
  }
  
  //Cred: Chris Whitmire Lessons
  //Vid: Getting a Player to move Left and Right in Processing (v=jgr31WIYWdk)
  void move() {
    if (moveL == true) {
      x -= currentspeed;
    }
    if (moveR == true) {
      x += currentspeed;
    }
    if (moveU == true) {
      y -= currentspeed;
    }
    if (moveD == true) {
      y += currentspeed;
    }
  }
  
  void attack() {
    
  }
  
  void intersect() {
    
  }
  
}
