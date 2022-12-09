// Revised from Daniel Shiffman's p5js Animated Sprite tutorial
// Expects .json spritesheet from TexturePack software

// https://editor.p5js.org/codingtrain/sketches/vhnFx1mml
// http://youtube.com/thecodingtrain
// https://thecodingtrain.com/CodingChallenges/111-animated-sprite.html

// Example Horse Spritesheet from
// https://opengameart.org/content/2d-platformer-art-assets-from-horse-of-spring

// Example Animated Sprite
// https://youtu.be/3noMeuufLZY

public class AnimatedSprite extends Sprite{
  
    private ArrayList<PImage> animation;
    private int w;
    private int len;
    private double speed;
    private int index;

    JSONObject spriteData;
    PImage spriteSheet;


  // Constructor for AnimatedSprite with Spritesheet (Must use the TexturePacker to make the JSON)
  // https://www.codeandweb.com/texturepacker
  public AnimatedSprite(int x, int y, double speed, String png, String json) {
    super(x,y,"none", true);

    this.animation = new ArrayList<PImage>();
 
    spriteData = loadJSONObject(json);
    spriteSheet = loadImage(png);
    JSONArray frames = spriteData.getJSONArray("frames");
    
    for(int i=0; i<frames.size(); i++){

      JSONObject frame = frames.getJSONObject(i);
      //System.out.println(i + ": " + frame + "\n");
      JSONObject fr = frame.getJSONObject("frame");
      //System.out.println("ss: " + fr + "\n");

      int sX = fr.getInt("x");
      int sY = fr.getInt("y");
      int sW = fr.getInt("w");
      int sH = fr.getInt("h");
      //System.out.println(i + ":\t sX:" + sX + ":\t sY:" + sY + ":\t sW:" + sW + ":\t sH:" + sH);
      PImage img = spriteSheet.get(sX, sY, sW, sH);
      animation.add(img);

      this.w = this.animation.get(0).width;
      this.len = this.animation.size();
      this.speed = speed;
      this.index = 0;
    }
  }


  //Overriden method: Displays the corect frame of the Sprite image on the screen
  public void show() {
    int index = (int) Math.floor(Math.abs(this.index)) % this.len;
    image(animation.get(Math.abs(this.index) % this.animation.size()), super.getX(), super.getY());
  }

  //animated method that makes the Sprite move to the right
  public void animate() {

    //adjust speed & frames
    this.index += this.speed * 10;
    super.move( (int) (this.speed * 15), 0 );
  
    //wraparound sprite if goes off the right or left
    if ( super.getX() > width ) {
      super.setX( -this.w );
    } else if ( super.getX() < -width ){
      super.setX( width );
    }

  }
  

}