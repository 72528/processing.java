float alpha;
float arcSize = 200;
float yStep = 10 ;
float sw;
void setup(){
    size(800,780);
  
}


void draw(){
 background(#eeeeee);
 
 mouseX  = constrain( mouseX,10,width);
 mouseY = constrain(mouseY,10, height);

//float yStep = mouseY; //cannot explain you need to watch it yourself. 
//float arcSize = mouseX;//by using this you can increase the size of art.
 noFill();
 stroke(20);
 
 for( float y =-arcSize ; y<height; y+=yStep){
  sw = map(sin(radians(y+alpha)),-1,1,2,yStep); //first loop move the circles from bottom to up with some displacement to other 
   strokeWeight(sw);
   for( float x1=arcSize/2  ; x1<arcSize+width; x1+=arcSize){   
     arc( x1,y, arcSize/2, arcSize/2,0 ,PI);
   }
  sw = map(sin(radians(y-alpha)),-1,1,2,yStep); 
   strokeWeight(sw);//second loop is used to give effect to the art that it blend on the first one 
 for( float x2 =0 ; x2<arcSize+width; x2+=arcSize){   
      arc( x2,y, arcSize/2, arcSize/2,PI, TWO_PI);
  
   }
 }
 alpha++;
}
