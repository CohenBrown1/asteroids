import java.util.ArrayList;

color black = #000000;
color white = #FFFFFF;
color navy = #446098;
color grey = #6B7483;
color cyan = #6498A7;
color red = #FA0000;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEWIN = 3;
final int GAMEOVER = 4;

PVector loc;
PVector vel;
PVector gravity;

float d;

boolean upkey, downkey, leftkey, rightkey, spacekey;

PFont myFont;

//Game Objects
Spaceship player1;

//List of Bullets
ArrayList<GameObject> objects;

void setup() {
  size(800, 600, P2D);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  //myFont = loadFont("OCRAExtended-48.vlw");
  //textFont(myFont);
  textSize(52);
  objects = new ArrayList();
  player1 = new Spaceship();
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());

  objects.add(player1);

}

void draw() {
  println(objects.size());
  if(mode == INTRO) {
  intro();
  } else if (mode == GAME) {
  Game();
  } else if (mode == PAUSE) {
  Pause();
  } else if (mode == GAMEWIN) {
  GameWin();
  } else if (mode == GAMEOVER) {
  GameOver();
  }
}
