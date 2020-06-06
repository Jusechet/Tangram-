class Figura {
  color c;
  float xPos;
  float yPos;
  int angulo;
  boolean mSel;
  boolean mClick;

  Figura(color c_, float xPos_, float yPos_, int angulo_, boolean mSel_, boolean mClick_) {
    c = c_;
    xPos = xPos_;
    yPos = yPos_;
    angulo = angulo_;
    mSel = mSel_;
    mClick = mClick_;
  }

  float darX() {
    return(xPos);
  }

  float darY() {
    return(yPos);
  }

  void mouseSel() {
    if ((sqrt(sq(mouseX-xPos)+sq(mouseY-yPos))) <= 15 ) {
      mSel=true;
      //cursor(HAND);
    } else {
      mSel=false;
      //cursor(ARROW);
    }
  }

  void mouseClick() {
    if (mousePressed && (mouseButton == LEFT) && mSel) {
      if (mClick==false) {
        mClick = true;
      } else {
        mClick = false;
      }
    }
  }


  void rotar() {
    if (mClick) {
      if (keyPressed && key == 'w') {
        angulo += 2;
      }
      if (keyPressed && key == 's') {
        angulo -= 2;
      }
    }
  }
}
