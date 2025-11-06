class Bullet extends GameObject {

  int timer;
 
  Bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    //ufo code: vel = new PVector(mouseX - loc.x, mouseY - loc.y);
    vel.setMag(10);
    //ufo code: vel.add(player1.vel);
    timer = 60;
    d = 10;
  }

  void show() {
    fill(white);
    stroke(#AA1EE3);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
  }
 
  void act() {
    loc.add(vel);
    wrapAround();
    timer--;
    if (timer == 0) lives = 0;
  }
}
