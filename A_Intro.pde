void intro() {
  background(black);

  fill(white);
  textSize(100);
  text("ASSTROIDS", width/2, height/2-100);
  
  fill(black);
  stroke(white);
  textSize(60);
  rect(400, 400, 200, 100);
  fill(white);
  text("Start", 400, 400);
}

void introClicks() {
 mode = GAME;
}
