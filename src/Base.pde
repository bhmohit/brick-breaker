class Base {
  float baseX;
  Base() {
    baseX = 40;
  }
  void moveBase() {
    baseX = map(mouseX, 0, 600, 20, 450);
  }
  void drawBase() {
    fill(255);
    rect(baseX, height-30, 130, 10, 10, 10, 10, 10);
    moveBase();
  }
}
