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
  private final float MOVE_SPEED = 4; 
  private final float GRAVITY = 0.6; //: ' ) 





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
  
  public void jump(){
    vy = -JUMP_SPEED;
  }
  public void display() {
    image(image, x, y, imageWidth, imageHeight);
  }

  //can we change this?
  public void movex() {
    x = x + vx;
  }
  public void movey() {
    vy = vy + GRAVITY; 
    y = y + vy;
    
  }
  
  public void setVelocityX(float vx){
    this.vx = vx;
  }


  // top = y - h/2
  public float getTop() {
    return y - imageHeight/2;
  }
  public float getBottom() {
    return y + imageHeight/2;
  }
  public float getLeft() {
    return x - imageWidth/2;
  }
  public float getRight() {
    return x + imageWidth/2;
  }
  // y = top + h/2
  public void setTop(float top) {
    y = top + imageHeight/2;
  }
  public void setBottom(float bottom) {
    y = bottom - imageHeight/2;
  }
  public void setRight(float right) {
    x = right - imageWidth/2;
  }
  public void setLeft(float left) {
    x = left + imageWidth/2;
  }
}
