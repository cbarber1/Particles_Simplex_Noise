ArrayList<Particle> particles;
// button;
float xoff_ = 200;
//OpenSimplexNoise noise;

public void settings() {
  size(600, 600);
}
void setup() {
  //size(600, 600);
  //button = createButton("switch");
  //button.position(580, 580);
  particles = new ArrayList<Particle>();
  //text("Perlin Noise", 300, 100);
  //noise = new OpenSimplexNoise();
}

void mousePressed() {
  Particle newP = new Particle();
  particles.add(newP);
  print("click");
}

void draw() {
  float back_col = map(noise(xoff_), 0, 1, 0 , 200);
  background(back_col);
  xoff_ += .0004;

 for (Particle p : particles) {
  // if (button.mousePressed()) {
  //   particles[i].switch();
  // }
    //let gravity = createVector(0, 0.5);
    //particles[i].applyForce(gravity);
    p.update();
    p.show();
 }

}
