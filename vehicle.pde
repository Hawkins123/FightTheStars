class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifeSpan; // how long the vechiel will survive for

  float mass = 1; 

  float r; //size of the agent

  float maxforce;    // Maximum steering force or how fast it turns
  float maxspeed;    // Maximum speed

  int s = 3;

  Vehicle(PVector location, float ms, float mf) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    position = location.get();
    r = 6;
    maxspeed = ms;
    maxforce = mf;
    lifeSpan = random(20000, 500000);
  }

  //update position
  void update() {
    //velocity is the change in acceleration over time
    velocity.add(acceleration);
    // Limit speed don't want it to go too fast
    velocity.limit(maxspeed);
    //position is the change in velocity over time
    position.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
    lifeSpan -= 1.0;
  }

  void applyForce(PVector force) {
    /// mass of vecheil is added here so that the Acceleration = Mass / Force
    force.div(mass);
    acceleration.add(force);
  }

  void seek(PVector target) {
    // A vector pointing from the position to the target
    PVector desired = PVector.sub(target, position);
    // Normalize desired and scale to maximum speed
    desired.setMag(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }

  // agent still useful?
  boolean isDead() {
    if (lifeSpan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  boolean contact(PVector target) {
    int limit = int(health/2)+int((2*r)+1);
    if (position.x <= target.x + limit && position.x >= target.x -limit && position.y <= target.y + limit && position.y >= target.y -limit) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    // Draw a triangle rotated in the direction of mouse 
    // basically the desired velocity
    float theta = velocity.heading2D() + PI/2;
    fill(255, 0, 0, lifeSpan);
    stroke(255, 0, 0, lifeSpan);
    strokeWeight(1);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
 
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }

  color selfContactX() {
    int offSet = int((2*r)+4);
    color coil =  get(int(position.x+offSet), int(position.y));
    color indication = color(0, 255, 0);
    fill(indication);
    noStroke();
    ellipse(int(position.x+offSet), int(position.y), s, s);
    return coil;
  }
  color selfContactY() {
    int offSet = int((2*r)+4);
    color coil =  get(int(position.x-offSet), int(position.y));
    color indication = color(0, 255, 0);
    fill(indication);
    noStroke();
    ellipse(int(position.x-offSet), int(position.y), s, s);
    return coil;
  }
  color selfContactUP() {
    int offSet = int((2*r)+3);
    color coil =  get(int(position.x), int(position.y+offSet));
    color indication = color(0, 255, 0);
    fill(indication);
    noStroke();
    ellipse(int(position.x), int(position.y+offSet), s, s);
    return coil;
  }
  color selfContactDOWN() {
    int offSet = int((2*r)+3);
    color coil =  get(int(position.x), int(position.y-offSet));
    color indication = color(0, 255, 0);
    fill(indication);
    noStroke();
    ellipse(int(position.x), int(position.y-offSet), s, s);
    return coil;
  }

  void run(PVector target) {
    //max speed nothing will stop it
    seek(target);

    //borders();
    update();
    display();
  }
}
