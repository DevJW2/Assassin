class player {
  PVector position; 
  float size;
  color c; 
  int xvel;
  int yvel;
  
  player(){
    c = color(0);
    position = new PVector(10, 10);
    size = 10; 
    xvel = 5;
    yvel = 5;
  }
  
  void display(){
    fill(c);
    ellipse(position.x,position.y,size,size);
  }


}