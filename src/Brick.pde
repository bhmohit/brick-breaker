class Brick {
  int x;
  int y;
  int sizeX;
  int sizeY;
  color col;
  boolean hit;

  Brick(int x, int y, int sizeX, int sizeY, color col) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.col = col;
    hit = false;
  }
  
  void drawBrick(){
    fill(col);
    rect(x,y,sizeX,sizeY);
    ifHit();
  }
  
  void ifHit(){
    if(hit){
      col = color(0);
    }
  }
  
  
}
