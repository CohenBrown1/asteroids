class Asteroid extends GameObject {

  float rotSpeed, angle;
  float d;
  int sizeFactor = 20;

  Asteroid() {
    super(random(0, width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*sizeFactor;
    rotSpeed = random(-2, 2);
    angle = 0;
  }

  Asteroid(int lives) {
    super(random(0, width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    d = lives*40;
    this.lives = lives;
    rotSpeed = random(-2, 2);
    angle = 0;
  }

  PShape rock;
  PVector plot = new PVector(100, 0);

  void show() {
    fill(black);
    stroke(white);
    strokeWeight(3);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(angle));
    circle(0, 0, d);
    line(0, 0, +lives*10/2, 0);
    popMatrix();
    angle = angle + rotSpeed;
  }

  void drawAsteroid() {
    circle(0, 0, d);
  }

  void act() {
    loc.add(vel);
    wrapAround();
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {

          obj.lives = 0;

          if (lives > 1) {
            Asteroid asteroid1 = new Asteroid(lives -1);
            Asteroid asteroid2 = new Asteroid(lives -1);
            asteroid1.d = d * 0.5;
            asteroid2.d = d * 0.5;

            asteroid1.loc = new PVector(loc.x + random(-50, 50), loc.y + random(-50, 50));
            asteroid2.loc = new PVector(loc.x + random(-50, 50), loc.y + random(-50, 50));

            asteroid1.vel.setMag(random(1, 3));
            asteroid2.vel.setMag(random(1, 3));
            asteroid1.vel.rotate(random(TWO_PI));
            asteroid2.vel.rotate(random(TWO_PI));

            objects.add(asteroid1);
            objects.add(asteroid2);
          }
          
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          
          lives = 0;
        }
      }
      i++;
    }
  }
}
