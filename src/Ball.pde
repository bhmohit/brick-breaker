int numHit = 0;

class Ball extends Base {
  int x;
  int y;
  int size;
  color col;
  int ballSpeedX;
  int ballSpeedY;

  Ball(int x, int y, color col, int size, int ballSpeedX, int ballSpeedY) {
    this.x = x;
    this.y = y;
    this.col = col;
    this.size =size;
    this.ballSpeedX = ballSpeedX;
    this.ballSpeedY = ballSpeedY;
  }

  void drawBall() {
    fill(col);
    ellipse(x, y, size, size);
    x += ballSpeedX;
    y += ballSpeedY;
    writeNumLives();
    ballWallCollision();
    ballBaseCollision();
    controlLives();
    ballBrickCollision();
  }

  void ballWallCollision() {
    //collision with walls
    if (x < 20 || x > width-20)
      ballSpeedX = -ballSpeedX;
    if (y < size)
      ballSpeedY = -ballSpeedY;
  }

  void ballBaseCollision() {
    if (x <= base.baseX+65 && x >= base.baseX  && y >= height-35) {
      goLeft();
    } else if (x >= base.baseX+65 && x <= base.baseX+130  && y >= height-35) {
      goRight();
    }
  }

  void goLeft() {
    ballSpeedX = -4;
    ballSpeedY *= -1;
  }
  void goRight() {
    ballSpeedX = 4;
    ballSpeedY *= -1;
  }

  void controlLives() {
    if ((x > base.baseX+120 || x < base.baseX) && y > height-30) {
      numLives--;
      y = 300;
    }
    if (numLives <= 0) {
      gameOver();
    }
  }

  void writeNumLives() {
    fill(0, 255, 0);
    textAlign(CENTER);
    textSize(15);
    text("Lives: " + numLives, 60, 40);
  }

  void gameOver() {
    background(0);
    y = height/2;
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(40);
    text("Game Over", 300, 300);
  }

  void gameOverWin() {
    background(0);
    y = height/2;
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(40);
    text("You Win!", 300, 300);
  }

  void ballBrickCollision() {
    for (int i = 0; i < positionXData.length; i++) {
      for (int j = 0; j < positionYData.length; j++) {
        if ((x >= positionXData[i] && x <= positionXData[i] + brickWidth/2) && y+10 >= positionYData[j] && y-10 <= positionYData[j] + 40 && !bricks[j][i].hit) {
          bricks[j][i].hit = true;

          goRight();
          numHit++;
        } else if ((x >= positionXData[i] + brickWidth && x<= positionXData[i] + brickWidth) && y+10 >= positionYData[j] && y-10 <= positionYData[j] + 40 && !bricks[j][i].hit) {
          bricks[j][i].hit = true;

          goLeft();
          numHit++;
        } else if (numHit == 35) {
          gameOverWin();
        }
      }
    }
  }
}
