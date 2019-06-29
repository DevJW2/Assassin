class Objective {

  PVector position; 
  float size;
  int speed;
  color c;
  String[] direction = {"UP", "DOWN", "LEFT", "RIGHT"};
  String currentValue; //Stores direction
  int counter; // 

  Objective() {
    speed = 1;
    c = color(0, 255,0);
    position = new PVector(775, 25);
    size = 10;
  }

  void move() {
    counter += 1;
    if (counter % 40 == 0) {
      int index = int(random(direction.length));
      currentValue = direction[index];
    }
    if (currentValue == "UP") {
      if (! grid.getVal((int)position.x, (int)position.y - speed) &&
        ((int)position.y-speed > 0)) {  
          position.y -= speed;
      }
    }
    if (currentValue == "DOWN") {
      int chkCoord = (int)position.y + 2;
      if (chkCoord < height) {
        if (! grid.getVal((int)position.x, (int)position.y + speed) &&
          ((int)position.y+speed < height)) { 
            position.y += speed;
        }
      }
    }
    if (currentValue == "RIGHT") {
      int chkCoord = (int)position.x + 2;
      //println(chkCoord);
      if (chkCoord < width) {
        if (! grid.getVal((int)position.x + speed, (int)position.y) &&
          ((int)position.x+speed < width)) {
            position.x += speed;
        }
      }
    }
    if (currentValue == "LEFT") {
      if (! grid.getVal((int)position.x - speed, (int)position.y) &&
        ((int)position.x-speed) > 0) {
          position.x -= speed;
      }
    }
  }
  
  void display(){
    fill(c);
    stroke(c);
    ellipse(position.x, position.y, size, size);
  }
}