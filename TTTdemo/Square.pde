public class Square{
  
  private PImage pi;
  private String mark;
  
  public Square(){
    this(" ");
  }

  public Square(String mark){
    this.mark = mark;
 

  }
  
  //accessor
  public String getMark(){
    return mark;
  }
  
  //mutator
  public void setMark(String mark){
    this.mark = mark;
  }
  
  public void setX(){
    if(mark.equals(" ")){
      mark = "X";
    } else {
      System.out.println("Already taken!");
    }
  }
  public void setO(){
    mark = "O";
  }
  
  public String toString(){
    return mark;
  }

  public PImage getImage(){
    return pi;
  }
  
}
