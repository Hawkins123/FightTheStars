Player P;
BombFactory Bomb;
ShootFactory Shoot;
float DIF = 1;
void setup() {
  fullScreen();
  //size(500,500);
  P = new Player();
  Bomb = new BombFactory();
  Shoot = new ShootFactory();
}
void draw() {
  background(255);
  P.input();
  P.update();
  //Bomb.hunt();
  Shoot.hunt();
  //P.shield();
  //Bomb.SelfHit();
  Shoot.SelfHit();
  apply();
}
void apply() {

  float random = random(0, 100);
  if (random<DIF) {
    Bomb.addVehicle(19, 0.030);
    Bomb.addVehicle(15, 0.30);
    Bomb.addVehicle(51, 0.10);
    // Bomb.addVehicle(35,5);
  }
  if (DIF<5) {
    DIF+=0.0003;
  }
}
//void mousePressed() {
//  Bomb.addVehicle(19, 0.030);
//}
