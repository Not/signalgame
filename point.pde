 //<>//


class wire {
  int x, y, yr, ly, presstime, pressed;
  float dy, d2y, acceleration, topvel;
  int[] pos;
  wire (float acceleration_) {
    x=200;
    pos= new int[x]; //Zamienić na stos?

    y=(height-bar)/2;
    for (int i=0; i<x; i++)pos[i]=y;
    dy=-5;
   setaccel(acceleration_);     

    topvel=150;
    presstime=0;
    energy=140;
  }

  int getX() {
    return x;
  }

  int getY() {
    return yr;
  }
  void setaccel(float accel) {
    acceleration=constrain(accel, 0, 0.12);
  }


  void move() {
    if ((keyPressed||mousePressed))
    { 
      if (pressed==0) {
        energy-=2;
      }
      pressed=1;
      // println(presstime);
      //presstime++;
      d2y=-acceleration;//-presstime*0.001;
    } else {
      d2y=acceleration;//+presstime*0.001;
      //presstime=0;
      pressed=0;
    }
  }

  int checkEdges() {
    if (getY()<0&&getY()>height-bar) {
      return -1;
    }
    return 1;
  }

  void display() {
    stroke(255);
    strokeWeight(4);

    for (int i=x-constrain(energy, 0, x)+1; i<=x-1; i++) {
      line(i-1, pos[i-1], i, pos[i]);
    }
  }

  int isAlive() {
    if (energy<=0) {
      return 0;
    } else return 1;
  }
  void update() {
    if (random(1)<0.03) energy++;
    

    dy+=d2y;

    y+=dy;//+(int)(random(2));
    yr=y;//+(int)(random(20));
    //if(dy>topvel) dy=topvel;
    pos[x-1]=getY();
    for (int i=0; i<=x-2; i++) { //przesuwanie w tablicy
      pos[i]=pos[i+1];
    }
  }

  void render() {
    update();
    display();
  }
}
