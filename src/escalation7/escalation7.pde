// Escalation 7
//   Ellie J 
//   Madeline H
//   Ollie G
//   Ethan S

//it sounded cool
float yvel, xvel, gravity;
int x, y, speed, dmg, health, ground, jump, evasion;
boolean death, onground;
PVector vect1;
void setup() {
fullScreen(); 
background(0, 0, 80);
x = 50;
y = 50;
speed = 100; 
dmg = 10;
health = 100;
jump = 10;
evasion = 0;
yvel = 0;
xvel = 2;
ground = 50;
}


void draw() {
  noStroke();
  ellipse(x, y, 50, 50);
  
  yvel += gravity;
  y += yvel;

  // Ground collision
  if (y > ground) {
    y = ground;
    yvel = 0;
    onground = true;
  } else {
    onground = false;
  }

}
