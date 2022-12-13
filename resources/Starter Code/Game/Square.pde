public class Square{
  
  private PImage pi;
  private String mark;
  final private static String noMark = " ";

  //Default Square constructor which puts an empty String mark in the Square
  public Square(){
    this(noMark);
  }

  //Square constructor which adds the specified String mark
  public Square(String mark){
    this.mark = mark;

  }
  
  // Accessor method that gets the mark in the Square
  public String getMark(){
    return mark;
  }
  
  // Mutator method that automatically changes the mark
  public void setMark(String mark){
    this.mark = mark;
  }

  // Mutator method sets a new mark in the Square 
  // if it does not already have a mark, 
  // returns true or false if successful
  public boolean setNewMark(String mark){
    if(this.mark.equals(noMark)){
      this.mark = mark;
      System.out.println("Successfully changed mark");
      return true;
    } else {
      System.out.println("That square is already taken!");
      return false;
    }
  }
  
  // Mutator method that sets an new PImage in the Square
  public void setImage(PImage pi){
    this.pi = pi;
  }

  //Accessor method that returns the PImage stored in the Square
  public PImage getImage(){
    return pi;
  }
  
  public String toString(){
    return mark;
  }


}
