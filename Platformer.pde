//Sprite ron;
//Sprite eve; 
Sprite p;
boolean rightKeyPressed; 
boolean leftKeyPressed; 
final float JUMP_SPEED = 11;
Map map; 
//note v stands for velocity
public void setup() {

  size(800,600);
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
  resolvePlatformCollisions(p, map.platforms);
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
  if (keyCode== UP && jumpAbillity(p, map.platforms)){
    p.jump();
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

/*
platforms = [all the platforms]
collisionList = [only the platforms colliding with the player]
*/


public void resolvePlatformCollisions(Sprite player, ArrayList<Sprite> platforms) {
  p.movey(); 
  ArrayList<Sprite> collisionListY = checkCollisionList(player,platforms);
  for (int cy = 0; cy < collisionListY.size(); cy++){//cy++ is the shorthand form of cy = cy + 1) {
    if (p.vy < 0) {
      player.setTop(collisionListY.get(cy).getBottom());
    }
    if (p.vy > 0) {
      player.setBottom(collisionListY.get(cy).getTop()); 
      p.vy = 0;
    }
  }
  p.movex();
  ArrayList<Sprite> collisionListX = checkCollisionList(player, platforms);
  for (int cx = 0; cx < collisionListX.size(); cx++) {
    if (p.vx < 0) {
      player.setLeft(collisionListX.get(cx).getRight());
    }
    if (p.vx > 0) {
      player.setRight(collisionListX.get(cx).getLeft());
    }
  }
}
/*
Write a void function named resolvePlatformCollisions that takes a player sprite and a list of sprites (platforms).
 The function should perform the following steps:
 
 1. move the player vertically
 2. compute the list of all platforms that collide with the player
 3. if our list is not empty:
 if player is moving up:
 set player.top = collidedPlatform.bottom
 if player is moving down:
 set player.bottom = collidedPlatform.top
 4. set player's vY to be 0 to prevent the player from falling more
 
 5. move the player horizontally
 6. compute the list of all platforms that collide with the player
 7. if our list is not empty:
 if player is moving right:
 set player's right edge equal to the platform's left edge
 if player is moving left:
 set player's left edge equal to the platform's right edge
 */
 
 public boolean jumpAbillity(Sprite player, ArrayList<Sprite> platforms){
   p.setBottom(p.getBottom()+1);
   ArrayList<Sprite> feetToSurface = checkCollisionList(player, platforms); 
   p.setBottom(p.getBottom()-1);
   return (feetToSurface.size()>0);
 }
 
