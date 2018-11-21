float diameter = 50;
float startingDiameter = diameter;
class Factory {
  ArrayList<Vehicle> vC;
  PVector mouse;
  color red = color(255, 0, 0);

  Factory() {
    vC = new ArrayList<Vehicle>();
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
    //store the values of the mouse
    mouse = new PVector(p.x, p.y);
    //mouse = new PVector(p.x,p.y);
    // Draw an ellipse at the mouse position
    fill(200);
    stroke(0);
    strokeWeight(2);
    ellipse(mouse.x, mouse.y, diameter, diameter);

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
      }
    }
  }
}
