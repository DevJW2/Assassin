class Region {
  float YCor; 
  float XCor;
  float OtherXCor;
  float OtherYCor; 
  float reach; 

  float square (float n) {
    return n * n;
  } 


Region(Enemy chaser, float x, float y, float length1) {
    // y value of defined region
    reach = length1;  
    XCor = x + chaser.position.x;
    YCor = y + chaser.position.y;
    OtherXCor = chaser.position.x - x;
    OtherYCor = YCor; 
  }

void movement(User victim, Enemy chaser, int speed) {
    float vx = victim.position.x;
    float vy = victim.position.y; 
    float distance = dist(victim.position.x, victim.position.y, chaser.position.x, chaser.position.y);  
    if (vx <= XCor && vx >= OtherXCor && vy <= YCor && 
    /* victim.position.y >= OtherYCor && */ vy >= chaser.position.y && distance <= reach) {
      chaser.follow(victim, speed);
    } else {
      chaser.move(); 
      chaser.c = color(0, 0, 255);
    }
  }
  
  
}