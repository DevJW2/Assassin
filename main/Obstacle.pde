
class Obstacle {

  int x, y; //x,y location
  int w, h; // width, height

  Obstacle () {
    x = 0;
    y = 0;
    w = 32;
    h = 32;

    grid.populateGrid(x, y, w, h);
  }

  Obstacle(int xpos, int ypos) {
    x = xpos;
    y = ypos;
    w = 32;
    h = 32;
    
    grid.populateGrid(x, y, w, h);
  }

  Obstacle(int xpos, int ypos, int boxW, int boxH) {
    x = xpos;
    y = ypos;
    w = boxW;
    h = boxH;
    
    grid.populateGrid(x, y, w, h);
  }
  
  
  void display() {
    noStroke();
    fill(100);
    
    // Draw boxes
    rect(x, y, w, h);
  }
}