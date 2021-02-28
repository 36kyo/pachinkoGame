ArrayList<Ball> Balls = new ArrayList<Ball>();
ArrayList<Ball> Targets = new ArrayList<Ball>();
float g = 0.05;

color backgroundColor = color(255);

// -----
float point = 0;
float targetPoint = 10;


void setup(){
  size(400, 400);
  Ball b = new Ball(200, 200, 10);
  //b.vx = 1;
  b.vy = 1;
  b.g = 0.05;
  b.fillColor = color(0,0,255);
  Balls.add( b );
  
  for(int i=0; i<3; i++){
    Ball t = new Ball(100 + i * 100, 100, 50);
    Targets.add(t);
  }
  
  
  textSize(20);
}
void draw(){
  background(backgroundColor);
  for(int i=0; i<Balls.size(); i++){
    Balls.get(i).update();
    Balls.get(i).display();
  }
  for(int i=0; i<Targets.size(); i++){
    Targets.get(i).update();
    Targets.get(i).display();
  }
  
  // collision  
  for(int i=0; i<Balls.size(); i++){
    Ball b = Balls.get(i);
    for(int j=0; j<Targets.size(); j++){
      Ball t = Targets.get(j);
      float collDist = sq(b.r) + sq(t.r); 
      float dist = sq(b.x - t.x) + sq(b.y - t.y);
      
      if (collDist >= dist){
        // destroy
        Targets.remove(j);
        point += targetPoint;
      }
    }
  }
  stroke(0);
  fill(0);
  text("point:" + str(point), 300, 50);
}

void mouseReleased(){
  Ball b = new Ball(mouseX, mouseY, 10);
  b.g = 0.05;//test
  Balls.add( b );
}
