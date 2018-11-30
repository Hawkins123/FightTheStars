PImage[] shoot = new PImage[4];
class ShootFactory {
  ArrayList<Vehicle> vC;
  color red = color(255, 0, 0);

  ShootFactory() {
    vC = new ArrayList<Vehicle>();
    shoot[0] = loadImage("shootFrameOne.png");
    shoot[1] = loadImage("shootFrameTwo.png");
    shoot[2] = loadImage("shootFrameThree.png");
    shoot[3] = loadImage("shootFrameFour.png");
  }
  void addVehicle(float speed, float turnSpeed) {
    vC.add(new Vehicle( new PVector(random(width), random(height)), speed, turnSpeed));
  }
  void removeVehicle() {
    for (int i = vC.size()-1; i >= 0; i--) {
      vC.remove(i);
    }
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

  void hunt() {
    for (int i = vC.size()-1; i >= 0; i--) {
      Vehicle v = vC.get(i);
      v.run(mouse);
      if (v.isDead()) {
        vC.remove(i);
      }
      if (v.contact(mouse)) {
        vC.remove(i);
        health-=1;
      }
    }
  }
}
