class Spaceship extends GameObject {

  //instance variables
  PVector dir; //direction
  int cooldown;

  //constructer
  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(0.1, 0);
    cooldown = 0;
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    d = lives*40;
    this.lives = lives;
  }

  //behaviour functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();
    popMatrix();
  }

  void drawShip() {
    fill(black);
    stroke(#E31EBF);
    strokeWeight(2);
    triangle(-10, -10, -10, 10, 30, 0);
    circle(15, 0, 5);
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround();
  }

  void move() {
    loc.add(vel);
    if (upkey) {
      vel.add(dir);
      objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, -2)));
    }


    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));

    vel.limit(4);
  }

  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 30;
    }
  }

  void checkForCollisions() {
    
    
  }
}
