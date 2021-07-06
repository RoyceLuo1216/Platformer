public class Sprite {
  /* the first part of classes are private instance variables 
   the second part are the contrstructors 
   the third are the behaviours */
  //instance variables 
  private float x;
  private float y;
  private float vx;
  private float vy;
  private float imageHeight; 
  private float imageWidth; 
  private PImage image; 
  private final float MOVE_SPEED = 2; 



  //constructors 
  public Sprite(float x, float y, PImage image, float scale) { 
    this.x = x;
    this.y = y;
    this.image = image; 
    this.imageHeight = image.height*scale; 
    this.imageWidth = image.width*scale;
  }

  //behaviours 

  public void setMovementRight() {
    vx = MOVE_SPEED;
  }
  public void setMovementLeft() { 
    vx = -MOVE_SPEED;
  }

  public void stopMovementX() {
    vx = 0;
  }
  public void display() {
    image(image, x, y, imageWidth, imageHeight);
  }
  
  //can we change this?
  public void move() {
    x = x + vx;
    y = y + vy;
  }
}
