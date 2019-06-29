Grid grid;
Obstacle [] walls;
Enemy security;
Objective target;
User player;

PImage bg;

void setup () {
  size(800, 600);
  bg = loadImage("cementFloor.jpg");

  int screenW, screenH;
  screenW = width;
  screenH = height;
  grid = new Grid(screenW, screenH);

  player = new User();
  security = new Enemy();
  target = new Objective();

  // Change width and height of walls here
  int maxX, maxY;
  maxX = 16;
  maxY = 16;

  // Create walls here
  int [][] wList = { 
    {0, 0, screenW-1, maxY}, // Top border
    {0, 0, maxX, screenH-1}, // Left border
    {0, screenH-maxY, screenW-1, maxY}, // Bottom border
    {screenW-maxX, 0, maxX, screenH-1}, // Right border

    //Upper Block
    {0, 0, 300, 50}, 

    //Upper Left Room
    {270, 100, maxX*2, 250}, 
    {100, 100, 200, maxY*2}, 
    {0, 310, 150, maxY*2+10}, 
    {225, 250, 50, 100}, 
    {130, 240, 170, maxY*2}, 
    {110, 200, maxX*2, 72}, 
    {200, 100, maxX*2, 75}, 

    // Bottom block next to user spawn
    {0, 550, 350, 50}, 


    // Right Square boxes
    {400, 100, 100, 100}, 
    {600, 100, 100, 100}, 
    {400, 300, 100, 100}, 
    {600, 300, 100, 100}, 
    
    // Bottom boxes
    {250, 500, 50, 50}, 
    {190, 500, 50, 50}, 

  };

  int rowNum = wList.length;
  walls = new Obstacle [ rowNum ];

  for (int row = 0; row < rowNum; row++) {
    walls[row] = new Obstacle (wList[row][0], wList[row][1], wList[row][2], wList[row][3]);
  }
}

void draw() {
  background(bg);
  player.display();
  player.move();

  security.display();
  security.move();

  player.kill();
  target.display();
  target.move();

  //CHANGES
  Region region = new Region(security, 85, 100, 100);
  fill(255, 0, 0, 105);
  noStroke();
  triangle(security.position.x, security.position.y, region.XCor, region.YCor, region.OtherXCor, region.OtherYCor); 
  region.movement(player, security, 5);
  //CHANGES

  if (target.c == color(185, 22, 22)) {
    player.win();
  }

  if (dist(player.position.x, player.position.y, security.position.x, security.position.y) 
    <= (player.size)/2 + (security.size)/2) {
    player.lose();
  }

  for (int i = 0; i < walls.length; i++) {
    walls[i].display();
  }
}