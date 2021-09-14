public class Player extends AnimatedSprite {
  private int lives; 
  private boolean onPlatform;
  public boolean isLookingRight;
  public boolean isLookingLeft;
  private ArrayList<PImage> standLeft;
  private ArrayList<PImage> standRight;
  private ArrayList<PImage> jumpLeft;
  private ArrayList<PImage> jumpRight; 
  private ArrayList<PImage> deathImages; 
 
  public Player(float x, float y, float scale, int frameRate) {

    super (x, y, loadImage("guy1.png"), scale, frameRate);
    lives = 3; 
    onPlatform = true; 
    standLeft = new ArrayList<PImage>() {
      {
        add(loadImage("data/pStanding.png"));
      }
    };
    standRight = new ArrayList<PImage>() {
      {
        add(loadImage("data/pStanding.png"));
      }
    };
    jumpLeft = new ArrayList<PImage>() {
      {
        add(loadImage("data/pJumpRight.png"));
      
      }
    };
    jumpRight = new ArrayList<PImage>() {
      {
        add(loadImage("data/pJumpRight.png"));
   

      }
    };
    leftImages = new ArrayList<PImage>() {
      {
        add(loadImage("data/guyLeft1.png"));
        add(loadImage("data/guyLeft2.png"));
        add(loadImage("data/guyLeft3.png"));

      }
    };
    rightImages = new ArrayList<PImage>() {
      {
        add(loadImage("data/guy1.png"));
        add(loadImage("data/guy2.png"));
        add(loadImage("data/guy3.png"));


      }
    };
    deathImages = new ArrayList<PImage>(){{
      add(loadImage("data/deathImage.png"));
    }};
    currentImages = standRight;
    
  }
  public void selectCurrentImages() {
 
    onPlatform = jumpAbility(this, map.platforms);
    //  inPlace = onPlatform && getVelocityX() == 0;
    //add a new branch to check for death animation, and should be at the top.
    if (isDead) 
    currentImages = deathImages;

    if (onPlatform) {
      if (getVelocityX() == 0) {
        if (isLookingLeft) {
          currentImages = standLeft;
        }
        if (isLookingRight) {
          currentImages = standRight;
        }
      }
      if ( getVelocityX() > 0) {
        currentImages = rightImages;
      }
      if ( getVelocityX() < 0) {
        currentImages = leftImages;
      }
    }
    else if (onPlatform == false){
      if (isLookingLeft){
        currentImages = jumpLeft;
      }
      if(isLookingRight){
        currentImages = jumpRight;
      }
      if(getVelocityX() == 0){
        currentImages = jumpRight;
      }
    }
    
    //try to think of the conditions for the 6 diff things. For example, current images to equal stand right we would have to look right and in place. 
    //the six are jump left and right, stand left and right, move left and right. using the onPlatform, inPlace and isLookingLeft and isLookingRight variables. 
    //also edit the pictures for the zombie and find the pictures for the player.
  }
}
