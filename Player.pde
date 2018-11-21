class player {
  float x = 50;
  float y = 50;
  float up = 0;
  float down = 0;
  float left = 0;
  float right = 0;
  float speed = 10;
  float fillSizeX = diameter/2;
  float fillSizeY = fillSizeX;

  player() {
  }
  void update() {
    x =  x + ( right - left)* speed;
    y =  y + ( down - up)* speed;
    if (x <= fillSizeX) {
      x = fillSizeX;
    }
    if (x >= (width-fillSizeX)) {
      x = (width- fillSizeX);
    }
    if (y <= fillSizeY) {
      y = fillSizeY;
    }
    if (y >= (height-fillSizeY)) {
      y = (height-fillSizeY);
    }
  }
}
