class Particle extends GameObject {
  float part;
  
  Particle(float x, float y, float vx, float vy) {
    super(x, y, vx, vy);
    d = 5;
    part = 225;
  }
  
  void show() {
    noStroke();
    fill(#FFFFFF, part);
    ellipse(loc.x, loc.y, d, d);
  }
  
  void act() {
    loc.add(vel);
    part = part - 5;
    if (part <= 0) {
      lives = 0;
    }
  }
}
