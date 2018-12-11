import java.util.Iterator;
import java.util.Random;

class wallspawner {
  float distance, interval;
  float  random, seed, size;
  ArrayList<wall> walls;
  wire wire1;
  float speed;


  wallspawner(int distance, float random, float size, wire wire1, float speed) {
    this.distance=distance;
    this.random=random;
    this.size=size;
    this.wire1=wire1;
    this.speed=speed;
    walls=new ArrayList<wall>();
    seed=0;
  }

  void spawn() {
    interval++;
    
    if (interval>(distance/speed)) {
      walls.add(new wall((int)(randomGaussian()*30+size), (int)(noise(seed*random)*(height-bar)), speed));
      seed++;interval=0;
      
    }
  }
  void set(int distance, float random, float size, float speed) {
    this.distance=distance;
    this.random=random;
    this.size=size;
    
      this.speed=constrain(speed, 0, 2.3);
    if (random<0.1) random=0.1;
    if (size<30) size=30;
  }


  void run() {
    // println(walls.size());
    this.spawn();

    Iterator<wall> it = walls.iterator();
    while (it.hasNext()) {
      wall w = it.next();
      w.render();
      w.checkCollision(wire1);
      if (w.isDead()) {
        it.remove();
      }
    }
  }
}
