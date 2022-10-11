//GAME VARIABLES
Grid grid = new Grid(3);

PImage bg;
PImage x_letter;
PImage o_letter;

String titleText = "Triple J TicTacToe";
String turnText = "Who goes first?";
String winner = "";

boolean isXTurn = true;
boolean isGameOver = false;

int numHorses = 5;
Sprite[] horses = new Sprite[numHorses];



void setup() {
  size(440,440);  //match screen size to bg image size
  surface.setTitle("Triple J Game");

  //Load images used
  bg = loadImage("images/grid.jpg");
  x_letter = loadImage("images/x_wood.png");
  x_letter.resize(100,100);
  o_letter = loadImage("images/o_wood.png");
  o_letter.resize(100,100);
 
  //construct 5 horses for end animation
  for(int i=0; i<numHorses; i++){
      horses[i] = new Sprite(0, i*75, Math.random() + 0.1, "sprites/horse_run.png", "sprites/horse_run.json");
  }

  print("TripleJ TicTacToe Game started...");

  //fullScreen();
}


void draw() {

  //set the title each loop
  surface.setTitle(titleText + "          " + turnText);
  
  //update the background
  background(bg);

  //update the screen based on the grid
  for(int r = 0; r<grid.getSize(); r++){
    for(int c= 0; c<grid.getSize(); c++){
      GridLocation loc = new GridLocation(r,c);
      
      //Paint X's and O's in the approprate grid locations
      if(grid.getSquare(loc).getMark().equals("X") ){
        image(x_letter,grid.getX(loc) - x_letter.width/2,grid.getY(loc) - x_letter.height/2);  
      } else if (grid.getSquare(loc).getMark().equals("O")){
        image(o_letter,grid.getX(loc) - o_letter.width/2,grid.getY(loc) - o_letter.height/2);
      }
      
    }
  }

  //determine how to prompt the next move
  if(isXTurn){
    turnText = "Click for X";
  } else {
    turnText = "Click for O";
  }

  //check if the game is over
  if(isThreeInARow()){
    endGame();

    //Show an animation of 5 running horses
    //System.out.println("horses: " + horses.length);
    for(Sprite horse: horses){
      horse.show();
      horse.animate();
    }
  }

}

//Method that automatically will run when a mouse click triggers it
void mouseClicked(){
  
  //check if click was successful
  boolean goodClick = false;

  //if clicked, change the mark in that square
  GridLocation lastClickedLoc = grid.getGridLocation();  
  System.out.println(lastClickedLoc);
  if(isXTurn){
    goodClick = grid.setMark("X", lastClickedLoc);
  } else {
    goodClick = grid.setMark("O", lastClickedLoc);
  }

  //alternate the turn if a good click
  if(goodClick){
    isXTurn = !isXTurn;
  }
}

//method to check if there are 3 marks in a row
public boolean isThreeInARow(){
  
  //check Row wins
  for(int r=0; r<grid.getSize(); r++){
    String markC0 = grid.getSquare(r,0).getMark();
    if(markC0 != " " 
       && grid.getSquare(r,1).getMark().equals(markC0) 
       && grid.getSquare(r,2).getMark().equals(markC0)
    ){
      System.out.println(markC0 + " wins (Three in a Row!)");
      winner = markC0;
      return true;
    }
  }

  //check row wins
  for(int c=0; c<grid.getSize(); c++){
    String markR0 = grid.getSquare(0,c).getMark();
    if(markR0 != " "
       && grid.getSquare(1,c).getMark().equals(markR0) 
       && grid.getSquare(2,c).getMark().equals(markR0)
    ){
      System.out.println(markR0 + " wins (Three in a Row)");
      winner = markR0;
      return true;
    }
  }

  //check diagonal wins
  String mark11 = grid.getSquare(1,1).getMark();
  if(mark11 != " "
     && ((grid.getSquare(0,0).getMark().equals(mark11)
     && grid.getSquare(2,2).getMark().equals(mark11))
     || (grid.getSquare(2,0).getMark().equals(mark11)
     && grid.getSquare(0,2).getMark().equals(mark11)))
  ){
    System.out.println(mark11 + " wins! (Three in a diagonal)");
    winner = mark11; 
    return true;
  }

  return false;
}

//method to do things once game is over
public void endGame(){
    System.out.println("THREE IN A ROW! ");
    surface.setTitle("Three in a Row!  " + winner + " wins! Game over! ");
    
   // noLoop();
}
