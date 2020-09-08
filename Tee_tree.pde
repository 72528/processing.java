float n= 0;
PGraphics tree;
PGraphics bg;
ArrayList<PVector> leafs;

float minHue, maxHue;
void setup() {
  //size( 900, 700);
  fullScreen();
  colorMode(HSB);
  noStroke();
  noLoop();

  createBackground();
  leafs= new ArrayList<PVector>();
  tree = createGraphics(width, height);
}



void createBackground() {
  bg= createGraphics(width, height);
  bg.beginDraw();
  bg.noStroke();
  for (float diam = 1.5 *width; diam > 0.5*width; diam -= 20) {
    bg.fill(map(diam, 0.5*width, 1.5*width, 255, 10));
    bg.ellipse(width/2, height/2, diam, diam);
  }
  bg.endDraw();
}


void draw() {
  image(bg, 0, 0);
  createTree();
  setHue();
  drawLeafs(10, 250, 0, 1);
  image(tree, 0, 0);
  drawLeafs(0, 20, 10, 40);
  ground();
}


void mousePressed() {
  redraw();
  for ( int i = leafs.size(); i>=0; i--) {
    leafs.remove(0);
  }
}



void createTree() {
  tree.beginDraw();
  tree.noStroke();
  tree.background(0, 0);
  for (int i=0; i<3; i++) {
    tree.fill(map(i, 0, 2, 60, 20));
    branch(width/2, height, 70, -HALF_PI, 150, 0);
  }
  tree.endDraw();
}



void branch(float x, float y, float bSize, float Theta, float bLength, float pos) {
  n += 0.01;
  float diam = lerp(bSize, 0.7*bSize, pos/bLength);
  diam *= map(noise(n), 0, 1, 0.4, 1.6);

  tree.ellipse(x, y, diam, diam);
  if (bSize >0.6) {
    if (pos<bLength) {
      x += cos(Theta + random(-PI/10, PI/10));
      y += sin(Theta + random(-PI/10, PI/10));
      branch(x, y, bSize, Theta, bLength, pos+1);
    } else {
      leafs.add(new PVector(x, y));
      boolean drawleftBranch = random(1) >0.1;
      boolean drawrightBranch = random(1) >0.1;

      if (drawleftBranch) branch(x, y, random(0.5, 0.7)*bSize, Theta-random(PI/15, PI/5), random(0.6, 0.8)*bLength, 0);

      if (drawrightBranch) branch(x, y, random(0.5, 0.7)*bSize, Theta+random(PI/15, PI/5), random(0.6, 0.8)*bLength, 0); 

      if (!drawleftBranch &&!drawrightBranch) {
        tree.pushMatrix();
        tree.translate(x, y);
        tree.rotate(Theta);
        tree.quad(0, -diam/2, 2*diam, -diam/6, 2*diam, diam/6, 0, diam/2);
        tree.popMatrix();
      }
    }
  }
}

void setHue() {
  float rdn0 = random(255);
  float rdn1 = random(255);
  minHue = min(rdn0, rdn1);
  maxHue = max(rdn0, rdn1);
}

void  drawLeafs(float minDiam, float maxDiam, float minAlpha, float maxAlpha) {
  for ( int i = 0; i< leafs.size(); i++) {
    float h = map(i, 0, leafs.size(), minHue, maxHue);
    float s = 255;
    float b = 255;
    float a = random(minAlpha, maxAlpha);     
    fill(h, s, b, a);
    float diam = random( minDiam, maxDiam);
    float jitterS = random(-30, 30)  ;
    float jitterY = random(-30, 30);
    ellipse(leafs.get(i).x + jitterS, leafs.get(i).y +jitterY, diam, diam);
  }
}


void ground() {
  fill(20);
  beginShape();
  vertex(0, height);
  for ( int i = 0; i<= width; i+= 50) {
    vertex(i, map( noise(n), 0, 1, height-30, height));
    n+=0.1;
  }
  vertex(width, height);
  endShape();
}
