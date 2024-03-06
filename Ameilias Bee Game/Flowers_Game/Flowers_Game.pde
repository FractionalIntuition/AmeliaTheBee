PImage Background;
PImage Gameover;
PImage Points;
PImage Start;
PImage Bee;
PImage Bugspray;
PImage Flower1;
PImage Flower2;
PImage Flower3;
PImage Flower4;
PImage Flower5;
PImage Flower6;
float beepos;


void setup() {
  size(500, 700);
  frameRate(120);
  Background = loadImage("Background.png");
  Gameover = loadImage("gameover.png");
  Points = loadImage("points.png");
  Start = loadImage("start.png");
  Bee = loadImage("bee.png");
  Bugspray = loadImage("bugspray.png");
  Flower1 = loadImage("flower1.png");
  Flower2 = loadImage("flower2.png");
  Flower3 = loadImage("flower3.png");
  Flower4 = loadImage("flower4.png");
  Flower5 = loadImage("flower5.png");
  Flower6 = loadImage("flower6.png");
  beepos = 185; //defines bee starting position

}  


void draw() {
  background(0);
  image(Background, 0, 0);
  image(Gameover, 60, 250);
  image(Points, 350, 2);
  image(Start, 115, 500);
  image(Bee, beepos, 545); //defines the bee x position and initializes at the bottom of the canvas
  image(Bugspray, 50, 5);
  image(Flower1, 100, 5);
  image(Flower2, 150, 5);
  image(Flower3, 200, 5);
  image(Flower4, 250, 5);
  image(Flower5, 300, 5);
  image(Flower6, 350, 5);
}

 void keyPressed() {
  
  if (keyCode == LEFT) {
    beepos -= 15;  
    
    if (beepos < 0) {
      beepos = 0;
    }

  

 } if (keyCode == RIGHT) {
    beepos += 15; 
    
    if (beepos > 345) {
      beepos = 345;
    }
  }
 }
