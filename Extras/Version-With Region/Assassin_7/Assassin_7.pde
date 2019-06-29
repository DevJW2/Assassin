Grid grid;
Obstacle [] walls;
Enemy security;
Objective target;
User player;

//PImage bg;
int screenW = width, screenH = height;

void setup () {
  size(800, 600);
  //bg = loadImage("cementFloor.jpg");
  
  grid = new Grid(screenW, screenH);
  
  player = new User();
  security = new Enemy();
  target = new Objective();
  
  int maxX, maxY;
  maxX = 16;
  maxY = 16;
  
  int [][] wList = { 
      {0, 0, screenW-1, maxY}, // Top border
      {0, 0, maxX, screenH-1}, // Left border
      {0, screenH-maxY, screenW-1, maxY}, // Bottom border
      {screenW-maxX, 0, maxX, screenH-1}, // Right border
      {600, 200, maxX, 200}, // Right wall

      {200, 200, maxX, 200}, // Left room, Left wall
      {0, 200, 200, maxY}, // Left room, Top wall
      {50, 384, 150, maxY}, // Left room, Bottom wall

      {screenW/3, screenH/3, maxX*2, maxY*2}, // Middle block
      {300, 450, maxX*2, maxY*2}, 
    };

    int rowNum = wList.length;
    walls = new Obstacle [ rowNum ];

    
  
}

void draw() {
  //background(bg);
  
  player.display();
  player.move();
  
  security.display();
  security.move();
  
  target.display();
  target.move();
  
  //CHANGES
  Region region = new Region(security, 100, 100, 100);
  fill(255,0,0,105);
  noStroke();
  triangle(security.position.x, security.position.y, region.XCor, region.YCor, region.OtherXCor, region.OtherYCor); 
  region.movement(player, security, 5);
  //CHANGES
  
  for (int i = 0; i < walls.length; i++) {
    walls[i].display();
  }
}