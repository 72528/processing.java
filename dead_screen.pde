

void setup(){
//size(1600,900);
fullScreen();
  background(2);
colorMode(RGB);
  
}

void draw(){
//  frameRate(120);
  background(100);
  //translate(width/12,height/30);
  for(int i=0;i<width;i+=random(1,5)){
      for(int j=0;j<height;j+=random(1,10)){
        if(i==width){
           width= width*-1;}else
  ellipse(i,j,10,10);
    fill(random(0,100),random(0,255));
  stroke(random(RGB));
  strokeWeight(3);}
 
  }
}
