void Game() {
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if ( f == numberOfFrames) f = 0;
  
  
  pauseButton();
  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if (currentObject.lives == 0)
      objects.remove(i);
    else 
        i++;
  }
  
  boolean hasAsteroids = false;
  for (int j = 0; j < objects.size(); j++) {
    if (objects.get(j) instanceof Asteroid) {
      hasAsteroids = true;
      break;
    }
  }
  if(!hasAsteroids) {
    mode = GAMEWIN;
    return;
  }
}

void gameClicks() {
 if (dist(20, 20, mouseY, mouseX) < 10) {
   mode = PAUSE;
 }
}

void pauseButton() {
  fill(white);
  noStroke();
  rect(17, 20, 3, 10, 5);
  rect(23, 20, 3, 10, 5);
}
