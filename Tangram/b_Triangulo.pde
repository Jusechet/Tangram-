class Triangle extends Figura{
  
  float p1;
  float p2;
  float p3;
  float p4;
  float p5;
  float p6;
  
  Triangle(char n_, color c_, float xPos_, float yPos_,float p1_, float p2_, float p3_, float p4_, float p5_, float p6_, float angulo_, boolean tSel_, boolean mClick_){
    super(n_, c_, xPos_, yPos_, angulo_, tSel_, mClick_);
    p1 = p1_;
    p2 = p2_;
    p3 = p3_;
    p4 = p4_;
    p5 = p5_;
    p6 = p6_;
    
  }
  
  void display(){
    
    if (mClick) {
      xPos = mouseX;
      yPos = mouseY;
      stroke(0);
    } else {
      stroke(c);
    }
    translate(xPos, yPos);
    fill(c);
    rotate(radians(angulo));
    triangle(p1,p2,p3,p4,p5,p6); 
  }
  
}
