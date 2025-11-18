// Escalation 7 | November 5, 2025
//   El J | Madeline H | Ollie G | Ethan S
import gifAnimation.*;
//it sounded cool
Mainguy Servant;
float yvel, xvel, gravity;
Gif kingtail;
int x, y, speed, dmg, health, ground, jump, evasion;
boolean death, onground, startscreen;
PVector vect1;
char screen;
Button settings, menu;
void setup() {
  fullScreen();
  background(0, 0, 80);
  textSize(40);
  kingtail = new Gif(this, "kingtailwave.gif");
  kingtail.loop();
  Servant = new Mainguy();
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
  screen = 'f';  //f for first screen, m for menu in game, s for settings, g for game
  startscreen = true;
  screen = 'f';
  settings = new Button("The 'ttings", width/2, height/2+200, 300, 60);
  menu =new Button("Menu", width/2, height/2+420, 300, 60);
}


void draw() {
  switch(screen) {
  case 'f':
    startScreen();
    settings.display();
    menu.display();
    break;
  case 'm':
    break;
  case 's':
  settingsScreen();
    break;
  case 'g':
    theGame();
    break;
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

  println(keyCode);
  if (keyCode == 32) {
    screen = 'g';
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


void startScreen() {
  background(20, 20, 0);
  textAlign(CENTER, CENTER);
  textSize(100);
  text("ESCALATION7", width/2, height/2);
  textSize(60);
  text("press space to start", width/2, height/2 + 100);
  imageMode(CENTER);
  image(kingtail, width/2, 250);
}

void settingsScreen() {
  background(30, 199, 93);
  textAlign(CENTER, CENTER);
  textSize(100);
  text("whats up my name's settings", width/2, 300);
}


void theGame() {
  background(0, 0, 80);
  fill(255);
  noStroke();
  Servant.display();
  Servant.move();
  textSize(40);
  text("press esc to leave", 500, 500);
  text("Welcome to  Escalation7 ", 400, 400);
  textSize(20);
  text("I will change the name later", 400, 440);
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
