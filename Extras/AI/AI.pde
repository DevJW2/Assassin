blueguy enemy; 
player user;

void setup(){
  size(600,400);
  enemy = new blueguy();
  user = new player();

}

void draw(){
  background(255);
  enemy.display();
  user.display();
}