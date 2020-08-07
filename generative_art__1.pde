


void setup(){
 size(800,720);
 background(#eeeeee);
 //noLoop();
}


void draw(){
  background(255);
  translate(width/2, height/2);
  for (int n =0;n<10;n++){
    stroke(  random(255),random(255),random( 255));
    
  for ( int a =0 ; a<360; a++){
   float  x = random(50,150);
   float xx = random(150,350);
   pushMatrix();
   rotate(radians(a));
   
   strokeCap(PROJECT);
   strokeWeight(4);  
   line(x,0,xx,0); 
  popMatrix();
    }
  }
 // saveFrame("frames/#####.png");
}

void keyPressed(){
  redraw();
}
