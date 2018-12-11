class wall {
  int gap_h;
  int gap_c;
  int open;
  float speed,openspeed;
  float  x=width;
  boolean hit=false;

  wall(int gclearance, int gheight, float speed) {
    this.gap_c=gclearance; 
    this.gap_h=gheight;
    this.speed=speed;
    open=0;
    openspeed=5;
    points++;
  }


  void render() {
    if(hit){
    stroke(255, 0, 0);
    }
    else{
    stroke(130);
    
    }
    strokeWeight(5);
    line(x, 0, x, gap_h-gap_c/2-open);
    line(x, height-bar, x, gap_h+gap_c/2+open); 
    x-=speed;
   // println(speed);
  }
  boolean isDead() {
    if (x<0) return true;
    return false;
  }

  boolean checkCollision(wire w) {
    if (abs(x-w.getX())<1&&abs(w.getY()-gap_h)>gap_c/2) {
        
        energy-=20;
        hit=true;
        }
        
      if(x+15<w.getX()){
      open+=openspeed;
      openspeed+=0.5;
      }
    
    return false;
  }
}
