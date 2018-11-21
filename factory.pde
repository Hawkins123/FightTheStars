float diameter = 150;
float startingDiameter = diameter;
PImage[] ship = new PImage[2];
class Factory {
  ArrayList<Vehicle> vC;
  PVector mouse;
  PVector xmouse;
  PVector center;
  color red = color(255, 0, 0);
  PVector velocity;
  float a;
  float shipOff;

  Factory() {
    vC = new ArrayList<Vehicle>();
    for (int i = 0; i < ship.length; i++) {
      ship[i] = loadImage("shipFrameOne.png");
    }
  }
  void addVehicle(float speed, float turnSpeed) {
    vC.add(new Vehicle( new PVector(random(width), random(height)), speed, turnSpeed));
  }
  void removeVehicle() {
    for (int i = vC.size()-1; i >= 0; i--) {
      vC.remove(i);
    }
  }
  void updatePlayer() {
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
    image(ship[0], 0, 0, diameter-shipOff, diameter-shipOff);
    popMatrix();

    showText();
  }
  void showText() {
    textSize(32);
    fill(0);
    textAlign(CENTER);
    text(int(diameter-startingDiameter), mouse.x, mouse.y+9);
  }

  // include shield mode
  void SelfHit() {
    for (int i = vC.size()-1; i >= 0; i--) {
      Vehicle v = vC.get(i);
      color crashX = v.selfContactX(); 
      color crashY = v.selfContactY();
      color crashUP = v.selfContactUP();
      color crashDOWN = v.selfContactDOWN();

      if (crashX==red) {
        vC.remove(i);
      } else if (crashY==red) {
        vC.remove(i);
      } else if (crashUP==red) {
        vC.remove(i);
      } else if (crashDOWN==red) {
        vC.remove(i);
      }
    }
  }

  void sheild() {
    int w = 100;
    int h = 30;
    // if (keyPressed == true) {
    if (key == 'w') {
      fill(red);
      rectMode(CENTER);
      noStroke();
      rect(mouse.x, (mouse.y-50)-(diameter-startingDiameter), w, h);
    }
    if (key == 'a') {
      fill(red);
      rectMode(CENTER);
      noStroke();
      rect((mouse.x-50)-(diameter-startingDiameter), mouse.y, h, w);
    }
    if (key == 's') {
      fill(red);
      rectMode(CENTER);
      noStroke();
      rect(mouse.x, (mouse.y+50)+(diameter-startingDiameter), w, h);
    }
    if (key == 'd') {
      fill(red);
      rectMode(CENTER);
      noStroke();
      rect((mouse.x+50)+(diameter-startingDiameter), mouse.y, h, w);
    }
    //  }
  }


  void hunt() {
    for (int i = vC.size()-1; i >= 0; i--) {
      Vehicle v = vC.get(i);
      v.run(mouse);
      if (v.isDead()) {
        vC.remove(i);
      }
      if (v.contact(mouse)) {
        vC.remove(i);
        diameter+=1;
        shipOff+=1;
      }
    }
  }
}
