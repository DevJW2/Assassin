Grid grid;
Obstacle [] walls;
Enemy security;
Objective target;
User player;


void setup () {
  size(800, 600);
  int screenW, screenH;
  screenW = width;
  screenH = height;
  grid = new Grid(screenW, screenH);

  // Change width and height of walls here
  int maxX, maxY;
  maxX = 16;
  maxY = 16;

  background(255);

  player = new User();
  security = new Enemy();
  target = new Objective();

  // Create walls here
  int [][] wList = { 
                      {0, 0, screenW-1, maxY},           // Top border
                      {0, 0, maxX, screenH-1},           // Left border
                      {0, screenH-maxY, screenW-1, maxY}, // Bottom border
                      {screenW-maxX, 0, maxX, screenH-1},  // Right border
                      {600, 200, maxX, 200},             // Right wall
                      
                      {200, 200, maxX, 200},             // Left room, Left wall
                      {0, 200, 200, maxY},               // Left room, Top wall
                      {50, 384, 150, maxY},              // Left room, Bottom wall
                      
                      {screenW/3, screenH/3, maxX*2, maxY*2},// Middle block
                      {300, 450, maxX*2, maxY*2},
                    };

  int rowNum = wList.length;
  walls = new Obstacle [ rowNum ];
  
  for (int row = 0; row < rowNum; row++){
    walls[row] = new Obstacle (wList[row][0], wList[row][1], wList[row][2], wList[row][3]);
  }
}

void draw() {
  background(255);
  player.display();
  player.move();
  
  security.display();
  security.move();
  
  target.display();
  target.move();
  
  player.kill();

  for (int i = 0; i < walls.length; i++) {
    walls[i].display();
  }
}