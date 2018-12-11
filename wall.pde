class wall {
  int gap_h; //wysokość dziury
  int gap_c; //rozmiar dziury
  int open;  //do "znikania" sciany
  float speed,openspeed;
  float  x=width; //start sciany po prawej
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
  boolean isOnscreen() {
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
      openspeed+=0.5; //otwieranie ruchem przyspieszonym
      }
    
    return false;
  }
}
