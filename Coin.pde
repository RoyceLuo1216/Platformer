public class Coin extends AnimatedSprite{
  
  public Coin(float x, float y){
    super ( x,  y,  loadImage("data/coin1.png"),  0.5, 10); 
   neutralImages = new ArrayList<PImage>(){{ //what the curly braces do are, right after Java creates the object, it will run all the statements inside the double curly braces.
    add(loadImage("data/coin1.png"));
    add(loadImage("data/coin2.png"));
    add(loadImage("data/coin3.png"));
    add(loadImage("data/coin4.png"));
    add(loadImage("data/coin5.png"));
   }};
   currentImages = neutralImages;
  }
}
