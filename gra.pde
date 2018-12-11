wire w1;
float speed,random,elastic,size;
int distance;


int gamestate=-1;
int bar=100;
int points;

int energy;


wallspawner ws1;


void setup() {
  
  size(700, 700);
  frameRate(80);
  smooth();
}

void draw() {
  //println(energy);
  if ((keyPressed||mousePressed)&&gamestate!=1) {
    gamestate=1;
    energy=150;
    points=0;
    size=100;
    speed=1;
    random=4;
    elastic=0.8;
    distance=200;
    w1=new wire(0.08);
      ws1=new wallspawner(distance, random, size, w1, speed);
      
  }
  



  
  if(energy<0) gamestate=0;
  if (gamestate==1) {
    ws1.set(200, random, size-=0.001, speed+=0.0002);
  w1.setaccel(elastic+=0.00001);
    background(0);
    w1.move();
    w1.render();
    ws1.run();
    fill(127);
    noStroke();
    rect(0, height-bar, width, height);
    noFill();

    fill(255);
    textSize(32);
    text(points, 10, 30);
    rect(0.1*width, -0.75*bar+height, 0.8*width*energy/w1.x, 0.5*bar);
  } else if (gamestate==0) {
    noStroke();
    fill(230, 0, 0);
    rect(0, height-bar, width, height);
    textSize(64);
    fill(255);
    text("Gameover", 200, height-bar/2);
   /// while(true){println("pfpgf");if((keyPressed||mousePressed)) break;}
    gamestate=-1;
  } else if (gamestate==-1) {
    textSize(32);
    text("Press Anything", 10, 30);
  }
}
