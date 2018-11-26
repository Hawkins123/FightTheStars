
class BombFactory {
  ArrayList<Vehicle> vC;
  color red = color(255, 0, 0);

  BombFactory() {
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
        shipOff+=1;
      }
    }
  }
}
