class blueguy {
  PVector position; 
  float size;
  color c; 
  int xvel;
  int yvel;
  String[] direction = {"UP","DOWN","LEFT","RIGHT"}; // IMPORTANT
  String currentValue; // IMPORTANT
  int counter; // IMPORTANT
  
  blueguy(){
    c = color(0,0,256);
    position = new PVector(width/2, height/2);
    size = 10; 
    xvel = 5;
    yvel = 5;
  }
  
  void display(){ // IMPORTANT 
    counter += 1;
  
     if (counter % 30  == 0){
        int index = int(random(direction.length));
        currentValue = direction[index];
     }
        if (currentValue == "UP"){
          fill(c);
          ellipse(position.x, position.y -= 2,size,size);
        }
        if(currentValue == "DOWN"){
           
          fill(c);
          ellipse(position.x, position.y += 2, size, size);
        }
        if(currentValue == "RIGHT"){
          fill(c);
          ellipse(position.x += 2, position.y, size, size);
        }
        if(currentValue == "LEFT"){
          fill(c);
          ellipse(position.x -= 2, position.y, size, size);
        }
        delay(20);
        
  }
    
  



}