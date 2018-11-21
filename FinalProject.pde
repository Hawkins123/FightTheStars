Factory Fct;
float DIF = 1;
void setup() {
  fullScreen();
  //size(500,500);
  Fct = new Factory();
}
void draw() {
  background(255);
  Fct.updatePlayer();
  Fct.hunt();
  Fct.sheild();
  Fct.SelfHit();
  apply();
}
void apply() {

  float random = random(0, 100);
  if (random<DIF) {
    Fct.addVehicle(19, 0.030);
    Fct.addVehicle(15, 0.30);
    Fct.addVehicle(51, 0.10);
   // Fct.addVehicle(35,5);
  }
  if (DIF<5) {
    DIF+=0.0003;
  }
}
//void mousePressed() {
//  Fct.addVehicle(19, 0.030);
//}