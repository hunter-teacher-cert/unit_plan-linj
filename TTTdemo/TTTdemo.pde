PImage bg;
PImage x;
Grid grid = new Grid(3);
//GridLocation lastClickedLoc;\
String title = "Triple J TicTacToe";


void setup() {
  size(440,440);
  bg = loadImage("grid.jpg");
  x = loadImage("X.png");
  x.resize(100,100);
    //image(x,200,100);
  print("hi");
  surface.setTitle("Triple J Game");
  //fullScreen();
}

void draw() {
  background(bg);

  circle(80, 80, 100);

  //update the screen based on the grid
  for(int r = 0; r<grid.getSize(); r++){
    for(int c= 0; c<grid.getSize(); c++){
      GridLocation loc = new GridLocation(r,c);
      
      if(grid.getSquare(loc).getMark().equals("X") ){
        image(x,grid.getX(loc) - x.width/2,grid.getY(loc) - x.height/2);  
      }
      
    }
  }
  
  if(grid.isGameOver()){
    System.out.println("Game over");
    surface.setTitle("Game over");
  }

  
  surface.setTitle(title);
}

void mouseClicked(){
    
    //if clicked, run a Grid command
    GridLocation lastClickedLoc = grid.getGridLocation();  
    System.out.println(lastClickedLoc);
    
    grid.setMark("X", lastClickedLoc);
    title += "\t Clicked";
    
   
    //grid.updateMark(lastClickedLoc);
  }
