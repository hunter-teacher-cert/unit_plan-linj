// Inspired by Daniel Shiffman's p5js Animated Sprite tutorial

public class Sprite {
  
    private int x;
    private int y;
    PImage spriteImg;
    private boolean isAnimated;


  // Main Constructor
  public Sprite(int x, int y, String spriteImg, boolean isAnimated) {
    this.x = x;
    this.y = y;
    this.isAnimated = isAnimated;
    if(!isAnimated){
      this.spriteImg = loadImage(spriteImg);
    }
  }

  // Simpler Constructor for Non-Animated Sprite
  public Sprite(int x, int y,  String spriteImg) {
    this(x, y, spriteImg, false);
  }


  // method to display the Sprite image on the screen
  public void show() {
      image(spriteImg, this.x, this.y);
  }

  // method to move Sprite image on the screen to a specific coordinate
  public void moveTo(int x, int y){
    this.x = x;
    this.y = y;
  }

  // method to move Sprite image on the screen relative to current position
  public void move(int x_change, int y_change){
    this.x += x;
    this.y += y;
  }


  // method to rotate Sprite image on the screen
  public void rotate(int degrees){

  }


  /*-- ACCESSOR METHODS --*/
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public PImage getImg(){
    return spriteImg;
  }
  public boolean getIsAnimated(){
    return isAnimated;
  }
  
  
  /*-- MUTATOR METHODS --*/
  public void setX(int x){
    this.x = x;
  }
  public void setY(int y){
    this.y=y;
  }
  public void setImg(PImage img){
    this.spriteImg = img;
  }
  public void setIsAnimated(boolean a){
    isAnimated = a;
  }

  

}