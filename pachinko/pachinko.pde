ArrayList<Ball> Balls = new ArrayList<Ball>();
ArrayList<Ball> Targets = new ArrayList<Ball>();
float g = 0.05;

color backgroundColor = color(255);

// -----
float point = 0;
float targetPoint = 10;
float floorLine = 350;//50

int mode = 1;//mouse

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
  
  float cx = width/2.0;
  float cy = 260;
  
  float cursorX = 0;
  float cursorY = 0;
  
  switch(mode){
    case 1:
      cursorX = mouseX;
      cursorY = mouseY;
      break;
  }
  
  stroke(0);
  fill(0);
  line(cx, cy + 50, cx, cy + 50+50);
  line(cx-50, cy, cx, cy + 50);
  line(cx+50, cy, cx, cy + 50);
  
  line(cx-50, cy, cursorX, cursorY);
  line(cx+50, cy, cursorX, cursorY);
  
  
  for(int i=0; i<Balls.size(); i++){
    Balls.get(i).update();
    Balls.get(i).display();
  }
  for(int i=0; i<Targets.size(); i++){
    Targets.get(i).update();
    Targets.get(i).display();
  }
  
  // collision target  
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
  
  line(0, floorLine, width, floorLine);
  
  // collision floor  
  for(int i=0; i<Balls.size(); i++){
    Ball b = Balls.get(i);
    
    if(b.y + b.r >= floorLine){
      Balls.remove(i);
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
