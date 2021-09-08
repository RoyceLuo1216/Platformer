//Sprite ron;
//Sprite eve; 
Player p;
boolean rightKeyPressed; 
boolean leftKeyPressed; 
final float JUMP_SPEED = 14;
final float MARGIN_LEFT = 100;
final float MARGIN_RIGHT = 400;
final float MARGIN_TOP = 200;
final float MARGIN_BOT  = 200;
int coinCount;
float viewX;
float viewY;
Map map; 

//note v stands for velocity
public void setup() {

  size(800, 600);
  p = new Player(50, 300, 0.75, 10); 
  viewX =  0;
  viewY = 0; 
  map = new Map ("data/map.csv");
  imageMode(CENTER);
  // eve = new Sprite(40, 500, 1, -2, loadImage("data/eve.png"), 3); 
  rightKeyPressed = false; 
  leftKeyPressed = false;
  coinCount = 0;
}

public void draw() {
  background(255);
  scroll();
  map.display();  
  p.display();
  displayText();
  resolvePlatformCollisions(p, map.platforms);
  collectCoins();
  
}

public void keyPressed() {
  if (keyCode == RIGHT) {
    p.setMovementRight();
    p.isLookingRight = true; 
    p.isLookingLeft =false;
    rightKeyPressed = true;
  } else if (keyCode == LEFT) {
    p.setMovementLeft();
    p.isLookingLeft = true;
    p.isLookingRight = false;
    leftKeyPressed = true;
    // } else if (key == ' ') {
    //  p.setMovement(MOVE_SPEED * -3);
  }
  if (keyCode== UP && jumpAbility(p, map.platforms)) {
    p.jump();
  }
}

public void keyReleased() {
  if (keyCode == RIGHT) {
    rightKeyPressed = false;
    if (leftKeyPressed) {
      p.setMovementLeft();
      p.isLookingLeft = true;
      p.isLookingRight = false;
    } else {
      p.stopMovementX();
    }
  } else if (keyCode == LEFT) {
    leftKeyPressed = false;
    if (rightKeyPressed) {
      p.setMovementRight();
      p.isLookingRight = true;
      p.isLookingLeft = false;
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
  ArrayList<Sprite> collisionListY = checkCollisionList(player, platforms);
  for (int cy = 0; cy < collisionListY.size(); cy++) {//cy++ is the shorthand form of cy = cy + 1) {
    if (p.getVelocityY() < 0) {
      player.setTop(collisionListY.get(cy).getBottom());
    }
    if (p.getVelocityY() > 0) {
      player.setBottom(collisionListY.get(cy).getTop()); 
      p.setVelocityY(0);
    }
  }
  p.movex();
  ArrayList<Sprite> collisionListX = checkCollisionList(player, platforms);
  for (int cx = 0; cx < collisionListX.size(); cx++) {
    if (p.getVelocityX() < 0) {
      player.setLeft(collisionListX.get(cx).getRight());
    }
    if (p.getVelocityX() > 0) {
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

public boolean jumpAbility(Sprite player, ArrayList<Sprite> platforms) {
  p.setBottom(p.getBottom()+1);
  ArrayList<Sprite> feetToSurface = checkCollisionList(player, platforms); 
  p.setBottom(p.getBottom()-1);
  return (feetToSurface.size()>0);
}

public void scroll() {
  if (p.getRight() > getRightBorder()){
    viewX = viewX + p.getRight() - getRightBorder();
  }
  if (p.getLeft() < getLeftBorder()){
    viewX = viewX - getLeftBorder( ) + p.getLeft();
  }
 if (p.getTop() < getTopBorder()){
  viewY = viewY  - getTopBorder() + p.getTop();
  }
  if (p.getBottom() > getBotBorder()){
    viewY = viewY + p.getBottom() - getBotBorder();
  }
   
translate(-viewX, -viewY);

}
public float getRightBorder(){
  return (viewX+width-MARGIN_RIGHT); 
}
public float getLeftBorder(){
  return (viewX + MARGIN_LEFT);
}
public float getTopBorder(){
  return (viewY + MARGIN_TOP);
}
public float getBotBorder(){
  return (viewY + height - MARGIN_BOT);
}

public void displayText(){
  fill(0,0,0);
  textSize(12);
  text("Coins:"+coinCount, viewX + 700, viewY+50); 
  text("Lives:"+p.lives, viewX+50, viewY+50);
  
}

public void collectCoins(){
  ArrayList<Sprite> collectedCoins = checkCollisionList(p, map.coins);
  for( Sprite coin: collectedCoins){ // same as: for i in range(collectedCoins); map.coins.remove(i);
    coinCount++;
    map.coins.remove(coin); //removing the current item in the list
    
  }
}
