/* autogenerated by Processing revision 1286 on 2022-12-08 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class ProcessingGame extends PApplet {

//GAME VARIABLES
Grid grid = new Grid(3);
PImage bg;
PImage player1;
String titleText = "NameOfYourGame";
String extraText = "Who's Turn?";
AnimatedSprite exampleSprite;


//Required Processing method that gets run once
 public void setup() {
  /* size commented out by preprocessor */;  //match screen size to bg image size
  surface.setTitle(titleText);

  //Load images used
  bg = loadImage("images/grid.jpg");
  player1 = loadImage("images/x_wood.png");
  player1.resize(100,100);
  
  //Animation & Sprite setup
  exampleAnimationSetup();


  println("Game started...");

  //fullScreen();   //only use if not using a specfic bg image
}

//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
 public void draw() {

  updateTitleBar();
  
  updateScreen();

  if(isGameOver()){
    endGame();
  }
  
}


//Known Processing method that automatically will run when a mouse click triggers it
 public void mouseClicked(){
  
  //check if click was successful
  System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")");

  //what to do if clicked?
  player1.draw();
  


}




//------------------ CUSTOM  METHODS --------------------//

//method to update the Title Bar of the Game
public void updateTitleBar(){

  if(!isGameOver()) {

    //set the title each loop
    surface.setTitle(titleText + "    " + extraText);

    //adjust the extra text as desired
    

  }

}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //update the background
  background(bg);
  
  //update other screen elements
  player1.draw();


}


//method to indicate when the main game is over
public boolean isGameOver(){
  return false;
}

//method to describe what happens after the game is over
public void endGame(){
    System.out.println("Game Over!");

    //Update the title bar

    //Show any end imagery
    exampleAnimation();

}

//example method that creates 5 horses along the screen
public void exampleAnimationSetup(){  
  int i = 2;
  exampleSprite = new AnimatedSprite(0, i*75, Math.random() + 0.1f, "sprites/horse_run.png", "sprites/horse_run.json");
}

//example method that animates the horse Sprites
public void exampleAnimation(){
      exampleSprite.show();
      exampleSprite.animate();
}
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
public class Grid{
  
  private int size;
  private Square[][] board;
  
  public Grid(){
     this(3);
  }

  public Grid(int size){
    this.size = size;
    board = new Square[size][size];
    
    for(int r=0; r<size; r++){
      for(int c=0; c<size; c++){
         board[r][c] = new Square();
      }
    }
  }
  
  public boolean setMark(String mark, GridLocation loc){
   
    boolean isGoodClick;

    int row = loc.getR();
    int col = loc.getC();
    
    isGoodClick = board[row][col].setMark(mark);
    printGrid();

    return isGoodClick;
    
  } 
  

  public void printGrid(){
   
    for(int r = 0; r<size; r++){
      for(int c = 0; c<size; c++){
         System.out.print(board[r][c]);
      }
      System.out.println();
    } 
  }
  
  public GridLocation getGridLocation(){
   
    //map the mouse coordinates to the grid GridLocation
    int sizeOfOneSquare = pixelHeight/this.size;
    //System.out.println(displayHeight + " " + pixelHeight + " " + sizeOfOneSquare);
    
    int row = mouseY/sizeOfOneSquare;
    int col = mouseX/sizeOfOneSquare;

    return new GridLocation(row, col);
  } 

  public int getX(GridLocation loc){
    
    int sizeOfOneSquare = pixelHeight/this.size;
 
    //calculate the center of the grid GridLocation
    int pixelX = (sizeOfOneSquare/2) + (sizeOfOneSquare * loc.getC()); 
    
    return pixelX;
  } 
  
  public int getY(GridLocation loc){
    
    int sizeOfOneSquare = pixelHeight/this.size;
 
    //calculate the center of the grid GridLocation
    int pixelY = (sizeOfOneSquare/2) + (sizeOfOneSquare * loc.getR()); 
    
    return pixelY;
  } 
  
  
  public int getSize(){
    return size;
  }
  
  public Square getSquare(GridLocation loc){
    return board[loc.getR()][loc.getC()];
  }
  public Square getSquare(int r, int c){
    return board[r][c];
  }
  
  public boolean isGameOver(){
    return false;
  }
  
}
public class GridLocation{
 
  int row;
  int col;
  
  public GridLocation(int row, int col){
    this.row = row;
    this.col = col;
  }
  
  public int getR(){
    return row;
  }
  
  public int getC(){
    return col;
  }
  
  public String toString(){
    return row + "," + col;
  }
  
}
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
public class Square{
  
  private PImage pi;
  private String mark;
  final private static String noMark = " ";
  final private static String xMark = "X";
  final private static String oMark = "O";
  
  public Square(){
    this(noMark);
  }

  public Square(String mark){
    this.mark = mark;

  }
  
  //accessor
  public String getMark(){
    return mark;
  }
  
  //mutator
  public boolean setMark(String mark){
    if(this.mark.equals(noMark)){
      this.mark = mark;
      System.out.println("Successfully changed mark");
      return true;
    } else {
      System.out.println("That square is already taken!");
      return false;
    }
  }
  
  public void setX(){
    if(mark.equals(noMark)){
      mark = xMark;
    } else {
      System.out.println("Already taken!");
    }
  }
  public void setO(){
    mark = oMark;
  }
  
  public String toString(){
    return mark;
  }

  public PImage getImage(){
    return pi;
  }
  
}


  public void settings() { size(440, 440); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ProcessingGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
