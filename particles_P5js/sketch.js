var particles = [];
//let button;
var xoff_ = 200;

function setup() {
  createCanvas(600, 600);
  //button = createButton("switch");
  //button.position(580, 580);
}

function mousePressed() {
  particles.push(new Particle(mouseX, mouseY));
}

function draw() {
  var back_col = map(noise(xoff_), 0, 1, 0 , 200);
  background(back_col);
  xoff_ += .0004;

 for (var i = 0; i < particles.length; i++) {
  // if (button.mousePressed()) {
  //   particles[i].switch();
  // }
    //let gravity = createVector(0, 0.5);
    //particles[i].applyForce(gravity);
    particles[i].update();
    particles[i].show();
 }

}
