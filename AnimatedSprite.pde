public class AnimatedSprite extends Sprite {
  public ArrayList<PImage> currentImages; 
  public ArrayList<PImage> neutralImages; 
  public ArrayList<PImage> leftImages; 
  public ArrayList<PImage> rightImages; 
  private int index; 
  private int frame; 
  private int frameRate; 

  //constructors 

  public AnimatedSprite(float x, float y, PImage image, float scale, int frameRate) {
    //extended class constructors, must always start by constructing the base class. 
    super(x, y, image, scale);
    //super always refers to the base class, like for an animated sprite, the base class is sprite class. Therefore super just refers to the sprite class 
    this.frameRate = frameRate; 
    this.index = 0; 
    this.frame = 0;

  }

  //behaviours 

  public void updateAnimation() {
    frame = (frame + 1) % frameRate;
    if (frame == 0) {
      if (super.vx == 0) {
        currentImages = neutralImages;
      }
      if (super.vx > 0) {
        currentImages = rightImages;
      }
      if (super.vx < 0) {
        currentImages = leftImages;
      }
      index = (index + 1) % currentImages.size();
      super.image = currentImages.get(index);
    }
  }
  public void display() {
    super.display();
    updateAnimation();
  }
}