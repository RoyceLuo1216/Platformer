//Sprite ron;
//Sprite eve; 
Sprite p;
boolean rightKeyPressed; 
boolean leftKeyPressed; 
//note v stands for velocity
public void setup() {

  size(800, 600);
  p = new Sprite(50, 300, loadImage("data/Ron.png"), 2); 
  imageMode(CENTER);
  // eve = new Sprite(40, 500, 1, -2, loadImage("data/eve.png"), 3); 
  rightKeyPressed = false; 
  leftKeyPressed = false;
}

public void draw() {

  background(75, 255, 200);
  p.display();
  p.move();
}

public void keyPressed() {
  if (keyCode == RIGHT) {
    p.setMovementRight();
    rightKeyPressed = true;
  } else if (keyCode == LEFT) {
    p.setMovementLeft();
    leftKeyPressed = true;
 // } else if (key == ' ') {
  //  p.setMovement(MOVE_SPEED * -3);
  }
}

public void keyReleased() {
  if (keyCode == RIGHT) {
    rightKeyPressed = false;
    if (leftKeyPressed) {
      p.setMovementLeft();
    } else {
      p.stopMovementX();
    }
  } else if (keyCode == LEFT) {
    leftKeyPressed = false;
    if (rightKeyPressed) {
      p.setMovementRight();
    } else {
      p.stopMovementX();
    }
  }
}
