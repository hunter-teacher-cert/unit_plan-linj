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
