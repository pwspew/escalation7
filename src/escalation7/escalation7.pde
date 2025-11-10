// Escalation 7 | November 5, 2025
//   El J | Madeline H | Ollie G | Ethan S

//it sounded cool
mainguy Servant;
float yvel, xvel, gravity;
int x, y, speed, dmg, health, ground, jump, evasion;
boolean death, onground;
PVector vect1;
void setup() {
  fullScreen();
  background(0, 0, 80);

  Servant = new mainguy();
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
  background(0, 0, 80);
  noStroke();
  Servant.display();
  Servant.move();
  textSize(40);
  text("press esc to leave", 500, 500);
   text("Welcome to  Escalation7 ", 400, 400);
   textSize(20);
   text("I will change the name later", 400, 420);
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

//Movement
void keyPressed() {
  if (key == 'a' || key == 'A') {
      Servant.moveL = true;
    }
    if (key == 'd' || key == 'D') {
      Servant.moveR = true;
    }
    if (key == 'w' || key == 'W') {
      Servant.moveU = true;
    }
    if (key == 's' || key == 'S') {
      Servant.moveD = true;
    }
}

void keyReleased() {
  if (key == 'a' || key == 'A') {
      Servant.moveL = false;
    }
    if (key == 'd' || key == 'D') {
      Servant.moveR = false;
    }
    if (key == 'w' || key == 'W') {
      Servant.moveU = false;
    }
    if (key == 's' || key == 'S') {
      Servant.moveD = false;
    }
}
