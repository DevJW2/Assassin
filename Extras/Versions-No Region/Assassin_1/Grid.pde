class Grid {

  boolean [][] grid;
  int xGridSize, yGridSize;

  Grid () {
    xGridSize = 800;
    yGridSize = 600;
    grid = new boolean[xGridSize][yGridSize];
    initGrid();
  }
  
  Grid (int worldW, int worldH) {
    xGridSize = worldW;
    yGridSize = worldH;
    grid = new boolean[xGridSize][yGridSize];
    initGrid();
  }
  
  void initGrid(){
    for (int i = 0; i < xGridSize; i++) {
      for (int j = 0; j < yGridSize; j++) {
        grid[i][j] = false;
      } // for j
    }  // for i
  }
  
   void populateGrid(int x, int y, int w, int h){
    for (int i = x; i < x+w; i++) {
      for (int j = y; j < y+h; j++) {
        grid[i][j] = true;
      } // for j
    }  // for i
  }
  
  boolean getVal (int x, int y) {
    return grid[x][y];
  }
  
}