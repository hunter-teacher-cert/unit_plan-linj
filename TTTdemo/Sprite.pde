// Revised from Daniel Shiffman's p5js Animated Sprite tutorial
// Expects .json spritesheet from TexturePack software

// https://editor.p5js.org/codingtrain/sketches/vhnFx1mml
// http://youtube.com/thecodingtrain
// https://thecodingtrain.com/CodingChallenges/111-animated-sprite.html

// Horse Spritesheet from
// https://opengameart.org/content/2d-platformer-art-assets-from-horse-of-spring

// Animated Sprite
// https://youtu.be/3noMeuufLZY

public class Sprite {
  
    private int x;
    private int y;
    private ArrayList<PImage> animation;
    private int w;
    private int len;
    private double speed;
    private int index;
    private boolean isAnimated;

    JSONObject spriteData;
    PImage spriteSheet;


  // Main Constructor
  public Sprite(int x, int y, double speed, String png, String json, boolean isAnimated) {
    this.x = x;
    this.y = y;
    this.animation = new ArrayList<PImage>();
    this.isAnimated = isAnimated;

    if(!isAnimated){
      PImage pi = loadImage(png);
      animation.add(pi);
    } else {
    
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
  }

  // Constructor for Non-Animated image
  public Sprite(int x, int y,  String png) {
    this(x, y, 0.0, png, "", false);
    //System.out.println("Non-animated sprite created");
  }

  // Constructor for Animated Image with Spritesheet (Must use the TexturePacker to make the JSON)
  // https://www.codeandweb.com/texturepacker
  public Sprite(int x, int y, double speed, String png, String json) {
    this(x, y, speed, png, json, true);
    //System.out.println("Animated sprite created");
  }


  //animated method to display the Sprite image on the screen
  public void show() {
    if(!isAnimated){
      image(animation.get(0), this.x, this.y);
    } else{
      int index = (int) Math.floor(Math.abs(this.index)) % this.len;
      image(animation.get(Math.abs(this.index) % this.animation.size()), this.x, this.y);
    }
  }

  //animated method that makes the Sprite move to the right
  public void animate() {

    if(isAnimated){
      //adjust speed & frames
      this.index += this.speed * 10;
      this.x += this.speed * 15;
    
      //wraparound sprite if goes off the right or left
      if (this.x > width) {
        this.x = -this.w;
      } else if (this.x < -width){
        this.x = width;
      }
    }
  }
  

}