public class Particle {
      float ranCol = random(3);

    //PVector[] history = new PVector[0];
    ArrayList history = new ArrayList();
    float xoff = random(10000);
    float yoff = random(20000);
    PVector vel = PVector.random2D();
    PVector pos = new PVector(random(200, 400), random(200, 400));


  //this.follow_mode = false;

 // void switch() {
 // if (!this.follow_mode) {
 //   this.follow_mode = true;
//  } else {
 //   this.follow_mode = false;
 // }
 // }
 // void applyForce(force) {
 //   this.acc.add(force);
 // }
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    //this.vel = createVector(map(noise(this.xoff),0,1, 0, width), map(noise(this.yoff), 0, 1, 0, height));
    //this.pos.add(this.vel);
    //if (this.follow_mode) {
      PVector acc = PVector.sub(mouse, pos);
      acc.setMag(.01);
  //  }
    pos.x = map((float) noise(xoff),0,1, 0, width);
    pos.y = map((float) noise(yoff), 0, 1, 0, height);
    xoff += .007;//. 007
    yoff += .007;
  //  if (this.follow_mode) {
      vel.add(acc);
      pos.add(vel);
  //  }

    //PVector v = new PVector(pos.x, pos.y);
    history.add(new PVector(pos.x, pos.y));

    //append(history, new PVector(pos.x, pos.y));
   // print(history.length);

    if (history.size() > 25) {
      history.remove(1);
    }


  }

  void show() {
    stroke(0);
   //noStroke();
    fill(0, 100);
    ellipse(pos.x, pos.y, 24, 24);
  //  print(history.length);

    for (int i = 0; i < history.size() ;i++) {
      float col = map(noise(xoff),0,1, 0, 100);
      float col1 = map(noise(xoff),0,1, 0, 100);
      float col2 = map(noise(xoff),0,1, 0, 100);
      noStroke();
      colorMode(RGB);
      if (this.ranCol < 1) {
        fill(col, 0, 0, 100);
      } else if (1 < ranCol || ranCol < 2) {
        fill(0, col2, col1, 100);
      } else {
        fill(0, 100);
      }
      PVector pos_his = (PVector) history.get(i);
      ellipse(pos_his.x, pos_his.y, i+2, i+2);
    }
  }
}
