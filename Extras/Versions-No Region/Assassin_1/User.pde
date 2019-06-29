class User {

  PVector position;
  int speed;
  int size;

  User () {
    position = new PVector (25, 540);
    speed = 3;
    size = 10;
  }


  void move () {
    if (keyPressed) {

      // "A" key, left
      if (key == 'a' || keyCode == 37) {  
        if (! grid.getVal((int)position.x - speed, (int)position.y) &&
          ((int)position.x-speed) > 0) {
          position.x -= speed;
        }
      }

      // "S" key, down
      if (key == 's' || keyCode == 40) { 
        int chkCoord = (int)position.y + speed;
        if (chkCoord < height) {
          if (! grid.getVal((int)position.x, (int)position.y + speed) &&
            ((int)position.y+speed < height)) { 
            position.y += speed;
          }
        }
      }

      // "D" key, right
      if (key == 'd' || keyCode == 39) { 
        int chkCoord = (int)position.x + speed;
        //println(chkCoord);
        if (chkCoord < width) {
          if (! grid.getVal((int)position.x + speed, (int)position.y) &&
            ((int)position.x+speed < width)) {
            position.x += speed;
          }
        } //if chkCoord
      }

      // "W" key, up
      if (key == 'w' || keyCode == 38) {  
        if (! grid.getVal((int)position.x, (int)position.y - speed) &&
          ((int)position.y-speed > 0)) { 
          position.y -= speed;
        }
      }
    }
  } // move


  void kill() {
    if (dist(player.position.x, player.position.y, target.position.x, target.position.y) 
      <= (player.size)/2 + (target.size)/2) {
      target.c = color(185, 22, 22);
    }
  }

  void quit() {
    noLoop();
  }



  void display() {
    fill(0);
    stroke(0);
    ellipse(position.x, position.y, size, size);
    println(position.x, position.y, grid.getVal((int)position.x, (int)position.y));
  } // display
} // User class