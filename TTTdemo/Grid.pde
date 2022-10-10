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
  
  public void setMark(String mark, GridLocation loc){
   
    int row = loc.getR();
    int col = loc.getC();
    
    board[row][col].setMark(mark);
    printGrid();
    
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
    System.out.println(displayHeight + " " + pixelHeight + " " + sizeOfOneSquare);
    
    int gridX = mouseX/sizeOfOneSquare;
    int gridY = mouseY/sizeOfOneSquare;
    
    return new GridLocation(gridY, gridX);
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
  
  /*
  //goal: display an X for the clicked GridLocation
  public void updateMark(GridLocation loc){
    
    int pixelX = grid.getX(loc);
    int pixelY = grid.getY(loc);
    
    Square s = board[loc.getR()][loc.getC()];
    
    image(s.getImage(),pixelX, pixelY);
    
  }
  */
  
  public int getSize(){
    return size;
  }
  
  public Square getSquare(GridLocation loc){
    return board[loc.getR()][loc.getC()];
  }
  
  public boolean isGameOver(){
    return true;
  }
  
}
