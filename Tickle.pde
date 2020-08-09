/*
 * Tickle. 
 //
 * The word "tickle" jitters when the cursor hovers over.
 * Sometimes, it can be tickled off the screen.
 */

String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(640, 360);
  
  // Create the font
  textSize(34);
  textAlign(CENTER, CENTER);
  //hr = 500;
  //vr = 400;
  hr = textWidth(message) / 2;
  //it set the jitters to some extent means limit the random motion of tickle.
  vr = (textAscent() + textDescent()) / 2;
  
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(204, 120);
  rect(0, 0, width, height);
  
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  fill(0);
  text("tickle", x, y);
  
}
