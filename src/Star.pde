class Star {
  float x;
  float y;
  float z;

  Star() {

    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
  }

  void update() {
    z = z - 2;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
    }
  }

  void show() {
    float opacity = map(z, 0, width/2, 255, 0);
    fill(255, 255, 255, opacity);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    float r = map(z, 0, width/2, 16, 0);
    ellipse(sx, sy, r, r);
  }

}
