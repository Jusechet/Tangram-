class Triangle extends Figura {

  float p1;
  float p2;
  float p3;
  float p4;
  float p5;
  float p6;

  Triangle(color c_, float xPos_, float yPos_, float p1_, float p2_, float p3_, float p4_, float p5_, float p6_, int angulo_, boolean mSel_, boolean mClick_, boolean mov_) {
    super(c_, xPos_, yPos_, angulo_, mSel_, mClick_);
    p1 = p1_;
    p2 = p2_;
    p3 = p3_;
    p4 = p4_;
    p5 = p5_;
    p6 = p6_;
  }

  float darp1() {
    return p1;
  }

  float darp2() {
    return p2;
  }

  float darp3() {
    return p3;
  }

  float darp4() {
    return p4;
  }

  float darp5() {
    return p5;
  }

  float darp6() {
    return p6;
  }


  void mouseSel() {
    super.mouseSel();
  }

  void mouseClick() {
    super.mouseClick();
  }

  void display() {

    if (mClick) {
      xPos = mouseX;
      yPos = mouseY;
      stroke(100, 0, 140);
    } else {
      stroke(199, 0, 255);
    }
    translate(xPos, yPos);
    fill(c);
    stroke(0);
    rotate(radians(angulo));
    triangle(p1, p2, p3, p4, p5, p6);
    fill(0);
    circle(0, 0, 20);
  }



  void rotar() {
    super.rotar();
  }
}
