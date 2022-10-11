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
