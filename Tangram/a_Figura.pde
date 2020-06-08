class Figura {
  char n;
  color c;
  float xPos;
  float yPos;
  float angulo;
  boolean tSel;
  boolean mClick;
  
  Figura(char n_, color c_, float xPos_, float yPos_, float angulo_, boolean tSel_, boolean mClick_){
    n = n_;
    c = c_;
    xPos = xPos_;
    yPos = yPos_;
    angulo = angulo_;
    tSel = tSel_;
    mClick = mClick_;
  }
  
  void mouseClick() {  // -> movimiento del objeto con el mouse //
    if (mousePressed && (mouseButton == LEFT) && PixColor == c) {
      mClick = true;
    } else {
      if(mousePressed && (mouseButton == RIGHT)){
        mClick = false;
      }
    }
  }
  
  void rotar(){  // -> rotacion con la rueda del mouse //
    if(mClick){
      angulo += anguloCont;
    }
  }
  
  void selec(){
    if(keyPressed && key == n){
      tSel = true;
    }else{
      if(keyPressed && key == 'q'){
        tSel = false;
      }
    }
  }
  
  void tMov(){  // -> metodo movimiento y rotacion con teclado //
    if(tSel){
      
      ////// movimiento //////
      
      if(keyPressed && keyCode == UP){
        yPos -= acc;
      }
      
      if(keyPressed && keyCode == DOWN){
        yPos += acc;
      }
      
      if(keyPressed && keyCode == LEFT){
        xPos -= acc;
      }
      
      if(keyPressed && keyCode == RIGHT){
        xPos += acc;
      }
      
      //// aceleracion ////
      
      if(keyPressed){
        acc *= 1.02;
      }
      
      if(!(keyPressed)){
        acc = 0.7;
      }
      
      ////// rotacion //////
      
      if(keyPressed && key == 'w'){
        angulo += acc;
      }
      
      if(keyPressed && key == 's'){
        angulo -= acc;
      }
    }
  }
}
