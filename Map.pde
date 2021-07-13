public class Map{
// variables 
  final static float SPRITE_SIZE = 50;
  final static float ORIGINAL_IMAGE_SIZE =18; 
  final static float SCALE = SPRITE_SIZE/ORIGINAL_IMAGE_SIZE; 
  
  private ArrayList<Sprite> platforms; 
  
  public Map(String file){
    PImage grassMC = loadImage("data/MCGrass.png");
    PImage normalGrass = loadImage("data/fakeGrass.png");
    PImage plastic = loadImage("data/Plastic.png");
    PImage wood = loadImage("data/wood.png"); 
    platforms = new ArrayList<Sprite>();
    String[] lines = loadStrings(file);    //ArrayList <String>

    /* lines = [
      "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
      "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
      "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
      ...
    ]
    
    */
    for(int r = 0; r < lines.length; r = r + 1){
      String[] values = lines[r].split(",");
      for(int c = 0; c < values.length; c = c + 1) {
        // we have access to the variable r, and the variable c
        // x = size/2 + c * size
        // y = size/2 + r * size
        // if values[c] == 1, 2, 3, 4 ... make the corresponding tile Sprite
        if (values[c] == "1") {
          Sprite block = new Sprite(x, y, grassMC, SCALE);
          platforms.add(block);
        }
      }
    }
  }
  
  
}
