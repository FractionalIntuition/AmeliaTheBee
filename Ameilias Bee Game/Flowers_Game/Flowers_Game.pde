PImage Background;
PImage Gameover;
PImage Points;
PImage Start;
PImage StartTint;
PImage Bee;
PImage Bugspray;
String[] flowerNames = {"flower1.png", "flower2.png", "flower3.png", "flower4.png", "flower5.png", "flower6.png"};
PImage[] flowers = new PImage[flowerNames.length];
PImage Flower1; // Blue
PImage Flower2; // Orange
PImage Flower3; // Pink
PImage Flower4; // Toast
PImage Flower5; // Purple
PImage Flower6; // Salmon
float beepos; // Varible for "Bee's Position"; beepos
boolean gameover = true; // Game Over state
boolean startOver = false; // Checks if moused over Start button
int points = -1;
color startHighlight;
float flower_x, flower_y, flower_value, speed, bugspray_x, bugspray_y;

void setup() { //Loads all assets
  size(500, 700);
  frameRate(120);
  Background = loadImage("Background.png");
  Gameover = loadImage("gameover.png");
  Points = loadImage("points.png");
  Start = loadImage("start.png");
  StartTint = loadImage("starttint.png");
  Bee = loadImage("bee.png");
  Bugspray = loadImage("bugspray.png");
  for (int i = 0; i < flowerNames.length; i++) {
  String flowernames = flowerNames[i];
  flowers[i] = loadImage(flowernames);
  }
  //Flower1 = loadImage("flower1.png");
  //Flower2 = loadImage("flower2.png");
  //Flower3 = loadImage("flower3.png");
  //Flower4 = loadImage("flower4.png");
  //Flower5 = loadImage("flower5.png");
  //Flower6 = loadImage("flower6.png");
  beepos = 185; //defines bee starting position
  startHighlight = color(0);
}  


void draw() { //Draws game 
  update(mouseX, mouseY);
  background(0);
  image(Background, 0, 0);
  if (!gameover){ //If the game hasn't started, hide all the assets
  image(Bee, beepos, 545); //defines the bee x position and initializes at the bottom of the canvas
  image(Bugspray, bugspray_x, bugspray_y);
  image(flowers[int(flower_value)], flower_x, flower_y);
        //head                  tail
  if ((beepos-30 <= flower_x && beepos+110 >= flower_x) && (flower_y <= 700 && flower_y >= 495.5)){
  points++;
  currFlower();
  }
  else if (flower_y > 700) { //If flower exceeds floor, reset
  currFlower();
  }
  else { //Drops the flower & Speeds up over time
  flower_y += 1+speed;
  speed = points/5; 
  }
  if ((beepos-30 <= bugspray_x && beepos+110 >= bugspray_x) && (bugspray_y <= 700 && bugspray_y >= 495.5)){
  gameover = true;
  currBugspray();
  }
  else if (bugspray_y > 700+int(random(0,5))) { //If bugspray exceeds floor by abritrary amount
  currBugspray();
  }
  else {
    bugspray_y += 2;
  }
  //image(flowers[0], 100, 5);
  //image(flowers[1], 150, 5);
  //image(flowers[2], 200, 5);
  //image(flowers[3], 250, 5);
  //image(flowers[4], 300, 5);
  //image(flowers[5], 350, 5);
  image(Points, 350, 2);
  textAlign(LEFT); //score
  textSize(30);
  fill(0);
  text(points, 455, 27, 50);
  }
  
  else { //Display the start button
  if (startOver) {  
    image(StartTint, 115, 500);
  }
  else {
    image(Start, 115, 500);
  }
  if (points != -1) { //If there's no score yet, don't show Game Over or Points
    image(Gameover, 60, 250);
    image(Points, 350, 2);
    textAlign(LEFT); //score
    textSize(30);
    fill(0);
    text(points, 455, 27, 50);
  }
  }
}

 void update(int x, int y) {
   if (overButton(115, 500, Start.width, Start.height)) { //Hard-coded position of button
   startOver = true;
   } else startOver = false;
 }

 void currFlower() { //Generates a new flower
   flower_x = random(50,350);
   flower_value = int(random(0,5));
   flower_y = 0;
 }
 
 void currBugspray() { //Generates a new flower
   bugspray_x = random(50,350);
   bugspray_y = random(-180,-30);
 }
 void mousePressed() { //Checks START and Game Over buttons
   if (startOver && gameover) {
     gameover = false;
     points = 0;
     currFlower();
     currBugspray();
   }
 }

 boolean overButton(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
 }
 
 void keyPressed() { //I/O Reading
 if (!gameover) { //If the gameover state is false
  if (keyCode == LEFT) { //Press Left, Goes Left
    beepos -= 15;  //15 pixels
    
    if (beepos < 0) {
      beepos = 0;
    }
  }
  
 if (keyCode == RIGHT) { //Press Right, Goes Right
    beepos += 15;  //15 pixels
    
    if (beepos > 345) {
      beepos = 345;
     }
   }
 }
 }
