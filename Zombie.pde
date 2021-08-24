public class Zombie extends AnimatedSprite {
  private float boundaryLeft;
  private float boundaryRight;

  public Zombie (float x, float y, float boundaryLeft, float boundaryRight) {
    super (x, y, loadImage("data/ZombieWalkRight0.png"), 0.5, 8);  
    rightImages = new ArrayList<PImage>() {
      {
        add(loadImage("data/ZombieWalkRight0.png"));
        add(loadImage("data/ZombieWalkRight1.png"));
        add(loadImage("data/ZombieWalkRight2.png"));
        add(loadImage("data/ZombieWalkRight3.png"));
        add(loadImage("data/ZombieWalkRight4.png"));
        add(loadImage("data/ZombieWalkRight5.png"));
        add(loadImage("data/ZombieWalkRight6.png"));
        add(loadImage("data/ZombieWalkRight7.png"));
      }
    };
    leftImages = new ArrayList<PImage>() {
      {
        add(loadImage("data/ZombieWalkLeft0.png"));
        add(loadImage("data/ZombieWalkLeft1.png"));
        add(loadImage("data/ZombieWalkLeft2.png"));
        add(loadImage("data/ZombieWalkLeft3.png"));
        add(loadImage("data/ZombieWalkLeft4.png"));
        add(loadImage("data/ZombieWalkLeft5.png"));
        add(loadImage("data/ZombieWalkLeft6.png"));
        add(loadImage("data/ZombieWalkLeft7.png"));
      }
    };
    this.boundaryLeft = boundaryLeft; 
    this.boundaryRight = boundaryRight; 
    this.setVelocityX(2);
  }
  public void display() {
    super.movex();
    /* after the zombie moves x, we check boundaries, we check if the getleft is equal or less than the boundaries setleft, 
    we have to flip the velocity x to move the zombie to the right. Once it hits the other boundary we would flip the velcity again
    */
   //looks like an if, if, else statement. 
    super.display();
  //does the animated animated sprite display 
  }
}
