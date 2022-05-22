void mediumScene() {
  background(0);
  base.drawBase();
  for (int i = 0; i < bricks.length; i++) {
    for (int j = 0; j < bricks[i].length; j++)
      bricks[i][j].drawBrick();
  }
  ballMedium.drawBall();
}
