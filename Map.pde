public class Map {
  // variables 
  final static float SPRITE_SIZE = 50;
  final static float ORIGINAL_IMAGE_SIZE =18; 
  final static float SCALE = SPRITE_SIZE/ORIGINAL_IMAGE_SIZE; 

  private ArrayList<Sprite> platforms; 
  private ArrayList<AnimatedSprite> coins; 
  //use this function to code in coins 

  public Map(String file) {
    PImage grassMC = loadImage("data/MCGrass.png");
    PImage normalGrass = loadImage("data/fakeGrass.png");
    PImage plastic = loadImage("data/Plastic.png");
    PImage wood = loadImage("data/wood.png"); 
  //  PImage guy = loadImage("data/guy1.png");
  //  PImage guy2 = loadImage("data/guy2.png");
    //PImage guy3 = loadImage("data/guy3.png");
    platforms = new ArrayList<Sprite>();
    String[] lines = loadStrings(file);    //ArrayList <String>
    ArrayList<PImage> guyArray = new ArrayList<PImage>(); 
    guyArray.add(guy);
    guyArray.add(guy2);
    guyArray.add(guy3);

    /* lines = [
     "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
     "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
     "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
     ...
     ]
     
     [  2      ] <--- values
     [        ]
     [        ]
     [        ]
     [        ]
     [        ]
     [   2     ] <--- "2"
     
     */
      for (int r = 0; r < lines.length; r = r + 1) {
      String[] values = lines[r].split(",");
      for (int c = 0; c < values.length; c = c + 1) {
        // we have access to the variable r, and the variable c
        // x = size/2 + c * size
        // y = size/2 + r * size
        // if values[c] == 1, 2, 3, 4 ... make the corresponding tile Sprite
        float x = SPRITE_SIZE/2 + c * SPRITE_SIZE;
        float y = SPRITE_SIZE/2 + r * SPRITE_SIZE; 
        // when you print something == something java thinks you are comparing the location of two tiems instead of the actual value. This is only true for comparing strings. Where you have to use ".equals" 
        if (values[c].equals("1")) {
          Sprite block = new Sprite(x, y, grassMC, SCALE);
          platforms.add(block);
        }
        if (values[c].equals("2")) {
          Sprite block = new Sprite (x, y, normalGrass, SCALE); 
          platforms.add(block);
        }
        if (values[c].equals("3")) {
          Sprite block = new Sprite (x, y, plastic, SCALE); 
          platforms.add(block);
        }
        if (values [c].equals( "4")) {
          Sprite block = new Sprite (x, y, wood, SCALE);
          platforms.add(block);
        }
   /*     if (values [c].equals ("5")){
          Sprite guys = new AnimatedSprite (x,y, guyArray.get(0), 0.5, 5, guyArray, guyArray, guyArray); 
          platforms.add(guys);
          System.out.println("made gus : D");*/
        
      }
      }
    }
  }
  //looping through each of the platforms with the list generated with the previous function to display each of the blocks in our game 
  public void display() {

    for (Sprite block : platforms) {
      block.display();
    }
  }
}
