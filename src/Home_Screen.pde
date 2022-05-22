//For the font
PFont x;

//Stars array: holds 400 star objects
Star[] stars = new Star[500];

//Brick Array
Brick[][] bricks = new Brick[5][7];
int[] positionXData = new int[7];
int[] positionYData = new int[5];
int brickWidth = 60;
int distanceFromSides = 40;
int brickY = 80;
boolean hitM = false;

//Buttons for each game mode
Button easy = new Button(130, 45, color(0, 190, 0), "Easy", 52, 330);
Button medium = new Button(130, 45, color(0, 0, 255), "Medium", 235, 330);
Button hard = new Button(130, 45, color(255, 0, 0), "Hard", 416, 330);

//Balls for each game mode
Ball ballEasy = new Ball(300, 300, color(255), 20, 0, 4);
Ball ballMedium = new Ball(300, 300, color(255), 20, 0, 5);
Ball ballHard = new Ball(300, 300, color(255), 20, 0, 6);

//The moving base
Base base = new Base();

//number of lives
int numLives = 3;

int scn = 0; // 0 corresponds to the home screen, 1 to easy, 2 to medium, and 3 to hard;

void setup() {
  x = createFont("eth.otf", 40);
  size(600, 600);

  for (int i = 0; i < bricks.length; i++) {
    int brickX = 40;
    for (int j = 0; j < bricks[i].length; j++) {
      if (i == 0) {
        positionXData[j] = brickX;
      }
      bricks[i][j] = new Brick(brickX, brickY, brickWidth, 15, color(random(100, 255), random(100, 255), random(100, 255)));
      brickX += (width-(distanceFromSides*2)-(brickWidth*7))/6 + brickWidth;
    }
    positionYData[i] = brickY;
    brickY += (width-(distanceFromSides*2)-(brickWidth*7))/6 + 40;
  }
  for (int i = 0; i < stars.length; i++)
    stars[i] = new Star();
  

  smooth();
}

void draw() {
  background(0);
  fill(255);
  writeText(); //writes text for "Brick Breaker"
  easy.drawButton(); //draws the easy button
  medium.drawButton(); // draws the medium button
  hard.drawButton(); //draws the hard button
  drawStars(); //draws the stars
  eventHandler(); //changes the value of scn by scanning mouse placements
  switchScene(); //switches the scene depending on the value of scn
}

void writeText() {
  textAlign(CENTER); //changes the text alignment
  textSize(50); //changes the text size
  textFont(x); //changes the text font
  text("Brick Breaker", width/2, height/2); //displays the text
}

void drawStars() {
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  popMatrix();
}

void eventHandler() {
  int mx = mouseX;
  int my = mouseY;
  if (mousePressed) {
    if (mx > 52 && mx < 52+130 && my > 330 && my < 330+45) {
      scn = 1;
    } else if (mx > 235 && mx < 235+130 && my > 330 && my < 330+45) {
      scn = 2;
    } else if (mx > 416 && mx < 416+130 && my > 330 && my < 330+45) {
      scn = 3;
    } else if ((mx > 200 && mx < 400 && my > 330 && my < 330+45) && scn != 0) {
      scn = 0;
    }
  }
}

void switchScene() {
  switch(scn) {
  case 1:
    easyScene();
    break;
  case 2:
    mediumScene();
    break;
  case 3:
    hardScene();
    break;
  }
}
