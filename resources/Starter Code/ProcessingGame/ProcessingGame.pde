//GAME VARIABLES
Grid grid = new Grid(3);
PImage bg;
PImage player1;
String titleText = "NameOfYourGame";
String extraText = "Who's Turn?";
AnimatedSprite exampleSprite;


//Required Processing method that gets run once
void setup() {
  size(440,440);  //match screen size to bg image size
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
void draw() {

  updateTitleBar();
  
  updateScreen();

  if(isGameOver()){
    endGame();
  }
  
}


//Known Processing method that automatically will run when a mouse click triggers it
void mouseClicked(){
  
  //check if click was successful
  System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")");

  //what to do if clicked?
  player1.
  


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
  exampleSprite = new AnimatedSprite(0, i*75, Math.random() + 0.1, "sprites/horse_run.png", "sprites/horse_run.json");
}

//example method that animates the horse Sprites
public void exampleAnimation(){
      exampleSprite.show();
      exampleSprite.animate();
}