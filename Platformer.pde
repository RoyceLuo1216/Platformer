//Sprite ron;
//Sprite eve; 
Sprite p;
boolean rightKeyPressed; 
boolean leftKeyPressed; 
Map map; 
//note v stands for velocity
public void setup() {

  size(800, 600);
  p = new Sprite(50, 300, loadImage("data/Ron.png"), 2); 
  map = new Map ("data/map.csv");
  imageMode(CENTER);
  // eve = new Sprite(40, 500, 1, -2, loadImage("data/eve.png"), 3); 
  rightKeyPressed = false; 
  leftKeyPressed = false;
}

public void draw() {
  background(255);
  map.display();


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

//checking for a collision by checking the 4 paramaters we set. 
public boolean checkCollision(Sprite s1, Sprite s2) {

  boolean case1 = s1.getRight() <= s2.getLeft(); 
  boolean case2 = s2.getRight() <= s1.getLeft();
  boolean case3 = s1.getBottom() <= s2.getTop();
  boolean case4 = s1.getTop() >= s2.getBottom();

  return (!case1 && !case2 && !case3 && !case4);
}

public ArrayList<Sprite> checkCollisionList(Sprite player, ArrayList<Sprite> platforms) {
  ArrayList<Sprite> collisionList = new ArrayList<Sprite>();
  // python way of iterating through a list
  //  for (int i = 0; i < platforms.size(); i = i+1){//i = iterating platforms//:
  //  platforms.get(i);
  //  }

  // we want to iterate through ArrayList<Sprite> (an array of Sprites)
  // each element in the list is of type "Sprite"
  for (Sprite platform : platforms) {
    // inside the loop, we can refer to the current element by using the variable platform (the variable defined above)
    if (checkCollision(player, platform)) {
      collisionList.add(platform);
    }
  }
  return collisionList;
}
