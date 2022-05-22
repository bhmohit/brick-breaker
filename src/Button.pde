class Button {
  int sizeY;
  int sizeX;
  color col;
  String text;
  int x;
  int y;

  Button(int sizeX, int sizeY, color col, String text, int x, int y) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.col = col;
    this.text = text;
    this.x = x;
    this.y = y;
  }

  void drawButton() {
    stroke(255);
    fill(col);
    rect(x, y, sizeX, sizeY);
    textSize(20);
    fill(255);
    textAlign(CENTER);
    text(text, x + sizeX/2, y + sizeY/2+8);
  }
}
