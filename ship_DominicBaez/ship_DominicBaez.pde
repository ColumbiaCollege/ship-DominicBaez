//Movement code for y-wing 

//variables for position
float xPos =0;
float yPos = 0;
float angle;
//Booleans for movement
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

PImage img;
void setup() {
  //window modifications
  size(1000, 800);
  background(0);
  img = loadImage ("y-wing.jpg");
  imageMode(CENTER);

  //starting position for image
  xPos = width/2;
  yPos = height/2;
}

void draw() {
  //wipe
  background(0);

  //update position
  if (left) {
    angle--;
  }
  if (right) {
    angle++;
  }
  if (down) {
    xPos -= cos(radians(angle));
    yPos -= sin(radians(angle));
    if (yPos>800) {
      yPos = 0;
    }
    if (xPos<-40) {
      xPos = width;
    }
    if (yPos<0) {
      yPos = height;
    }
    if (xPos>1040) {
      xPos = 0;
    }
  }
  if (up) {
    xPos += cos(radians(angle));
    yPos += sin(radians(angle));

    if (yPos<0) {
      yPos = height;
    }
    if (xPos>1040) {
      xPos = 0;
    }
    if (yPos>800) {
      yPos = 0;
    }
    if (xPos<-40) {
      xPos = width;
    }
  }
  //draw image
  translate(xPos, yPos);
  rotate(radians(angle));

  image(img, 0, 0, 50, 30);
}

void keyPressed() {
  if (keyPressed == true) {
    if (key == 'a') {
      left = true;
    }
  }
  if (keyPressed == true) {
    if (key == 'd') {
      right = true;
    }
  }
  if (keyPressed == true) {
    if (key == 's') {
      down = true;
    }
  }
  if (keyPressed == true) {
    if (key == 'w') {
      up = true;
    }
  }
}
void keyReleased() {
  if (key == 'a') {
    left = false;
  }
  if (key == 'd') {
    right = false;
  }
  if (key == 's') {
    down = false;
  }
  if (key == 'w') {
    up = false;
  }
}
