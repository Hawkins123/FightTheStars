
PImage[] ship = new PImage[2];
float health = 150;
float startingHealth = health;

PVector mouse;
PVector xmouse;
PVector center;
PVector velocity;
float xDelta;
float yDelta;
float x = 100;
float y = 100;
float shipOff;
float thrust = 0;
float turn = 0;
float angle;
float offset = PI/2;

class Player {
  PVector position;
  color red = color(255, 0, 0);

  void input() {
  }

  void update() {
    if (keyPressed == true) {
      if (key == 'w') {
        thrust = 3;
      } else if (key == 's') {
        thrust = -1;
      } else {
        thrust = 0;
      }
      if (key == 'a') {
        turn = -PI/48;
      }else if (key == 'd') {
        turn = PI/48;
      } else {
        turn = 0;
      }
    }
    fill(200);
    stroke(0);
    strokeWeight(2);
    imageMode(CENTER);
    pushMatrix();
    angle += turn;
    xDelta = thrust*cos(angle);
    yDelta = thrust*sin(angle);
    translate(x + xDelta, y + yDelta);
    x += xDelta;
    y += yDelta;
    //float lastTurn = turn;
    //if (turn==0) {
    //  turn = lastTurn;
    //}
    rotate(angle+offset);
    shipOff = 20;
    image(ship[0], 0, 0, health-shipOff, health-shipOff);
    popMatrix();
    //showText();
  }

  void showText() {
    textSize(32);
    fill(0);
    textAlign(CENTER);
    text(int(health-startingHealth), mouse.x, mouse.y+9);
  }

  void shield() {
    int w = 100;
    int h = 30;
    /*/ if (keyPressed == true) {
     if (key == 'w') {
     fill(red);
     rectMode(CENTER);
     noStroke();
     rect(mouse.x, (mouse.y-50)-(health-startingHealth), w, h);
     }
     if (key == 'a') {
     fill(red);
     rectMode(CENTER);
     noStroke();
     rect((mouse.x-50)-(health-startingHealth), mouse.y, h, w);
     }
     if (key == 's') {
     fill(red);
     rectMode(CENTER);
     noStroke();
     rect(mouse.x, (mouse.y+50)+(health-startingHealth), w, h);
     }
     if (key == 'd') {
     fill(red);
     rectMode(CENTER);
     noStroke();
     rect((mouse.x+50)+(health-startingHealth), mouse.y, h, w);
     }
     //  }*/
  }
}
