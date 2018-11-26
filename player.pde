
PImage[] ship = new PImage[2];
float health = 150;
float startingHealth = health;

PVector mouse;
PVector xmouse;
PVector center;
PVector velocity;
float a;
float shipOff;
int thrust = 0;
int turn = 0;
class Player {
  color red = color(255, 0, 0);
  
  void input() {
    if (keyPressed == true) {
      if (key == 'w') {
        thrust = 3;
      } else if (key == 's') {
        thrust = -1;
      } else {
        thrust = 0;
      }
      if (key == 'a') {
        turn = -5;
      }
      if (key == 'd') {
        turn = 5;
      }
    }
  }
  
  void update() {
    mouse = new PVector(mouseX, mouseY);
    xmouse = new PVector(mouse.x, mouse.y);
    center = new PVector(pmouseX, pmouseY);
    xmouse.sub(center); 
    fill(200);
    stroke(0);
    strokeWeight(2);
    imageMode(CENTER);
    pushMatrix();
    translate(pmouseX, pmouseY);
    float lasta = a;
    a = atan2(xmouse.y, xmouse.x);
    if (a==0) {
      a = lasta;
    }
    float offset = PI/2;
    println(a);
    rotate(a+offset);
    shipOff = 20;
    image(ship[0], 0, 0, health-shipOff, health-shipOff);
    popMatrix();
  
    showText();
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
    // if (keyPressed == true) {
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
    //  }
  }
}
