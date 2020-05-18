PImage img;

////////
Triangle Trg;
Triangle Tvg;
Triangle Tnm;
Triangle Tmp;
Triangle Tcp;
Quad Cpa;
Quad Pa;
////////

String mouseSel;
boolean mouseClick = false;

//variable de victoria 
boolean victoria=false;

//numero de pixeles blancos
int pixB=0;

//nivel
int niv=1;

//iniciar juego(predeterminado o creado) o creador
boolean injuego=false; 
boolean niveles=false;
boolean creados=false;
boolean increador=false;

//cerrar menu
boolean menu=true;
boolean botones=true;

//variables colores
float R=random(255);
float G=random(255);
float B=random(255);

//Figuras modo creador 

//Triangulo grande 1
int xTG1=200;
int yTG1=500;
float anguloTG1=0;
boolean movTG1=false;
boolean movKeyTG1=false;

@Override 
  void setup() {
  size (1650, 875);
  rectMode(CENTER);
  ///Objetos///
    Trg = new Triangle(color(255,0,0), 1135, 250, -125, 250, -125, -250, 125, 0, 0, false, false, false);
    Tvg = new Triangle(color(0,255,0), 1250, 700, -250, -125, 250, -125, 0, 125, 0, false, false, false);
    Tnm = new Triangle(color(255,153,0), 1500, 180, 90, -160, -160, 90, 90, 90, 0, false, false, false);
    Tmp = new Triangle(color(200,0,255), 800, 500, 0, -62, -125, 63, 125, 63, 0, false, false, false);
    Tcp = new Triangle(color(132,85,4), 900, 750, 63, -125, 63, 125, -62, 0, 0, false, false, false);
    Cpa = new Quad(color(255,255,0), 1500, 400, 0, -125, 125, 0, 0, 125, -125, 0, 0, false, false, false);
    Pa = new Quad(color(0,0,255), 800, 200, -187, 63, 63, 63, 188, -62, -62, -62, 0, false, false, false);
  ////////////
  img = loadImage("table.jpg");
  strokeWeight(5);
}

void draw() {

  background(img);
  stroke(0, 0, 0);
  pixB=0;

  //variables colores
  float R=random(255);
  float G=random(255);
  float B=random(255);

  if (movTG1) {
    xTG1=mouseX;
    yTG1=mouseY;
  }

  //Menu pricipal 

  if (menu) {
    //Titulo "Tangram"
    fill(238,225,127);
    textSize(300);
    text("Tangram", 150, 300);

    //Boton play 
    fill(255, 255, 255);
    quad(150, 700, 150, 500, 690, 500, 690, 700);
    fill(R, G, B);
    textSize(200);
    text("PLAY", 175, 675);

    //Boton creador
    fill(255, 255, 255);
    quad(900, 700, 900, 500, 1440, 500, 1440, 700);
    fill(R, G, B);
    textSize(100);
    text("CREADOR", 925, 637.5);

    ///evento para inicio de partida///
    if (((mouseX>=150 && mouseX<=690 && mouseY<=700&& mouseY>=500 && mousePressed == true) || keyPressed == true) && injuego==false) {
      injuego=true;
      menu=false;
    }

    ///evento para modo creador///
    if (((mouseX>=900 && mouseX<=1440 && mouseY<=700&& mouseY>=500 && mousePressed == true) || keyPressed == true) && increador==false) {
      increador=true;
      menu=false;
    }
  } else {

    if (increador) {
      textSize(100);
      fill(R, G, B);
      text("Crea tu propio nivel ", 10, 125);

      //Triangulo grande 1 
      push();
      translate(xTG1, yTG1);
      stroke(255, 255, 255);
      fill(255, 255, 255);
      rotate(radians(anguloTG1));
      triangle(-100, 225, -100, -225, 100, 0);

      //circulo inscrito en Trg
      fill(0, 0, 0);
      circle(0, 0, 20); 
      pop();
      if (mouseClick == false) {
        if ((sqrt(sq(mouseX-xTG1)+sq(mouseY-yTG1))) <= 15 ) {
          mouseSel="TG1";
          cursor(HAND);
        } else {
          cursor(ARROW);
        }
      }

      //Guardar nivel
      //Boton de guardado
      stroke(0, 0, 0);
      fill(255, 255, 0);
      quad(1425, 700, 1425, 600, 1600, 600, 1600, 700);
      fill(0, 0, 0);
      textSize(50);
      text("SAVE", 1450, 670);
      if (((mouseX>=1425 && mouseX<=1600 && mouseY<=700&& mouseY>=600 && mousePressed == true) || keyPressed == true) ) {
        save("Prueba 2.jpg");
      }
    }

    if (injuego) {

      if (botones) {
        //Boton play predeterminado 
        fill(255, 255, 255);
        quad(150, 300, 150, 500, 700, 500, 700, 300);
        fill(R, G, B);
        textSize(100);
        text("NORMALES", 160, 437.5);
        if (((mouseX>=150 && mouseX<=700 && mouseY<=500&& mouseY>=300 && mousePressed == true) || keyPressed == true) ) {
          niveles=true;
          botones=false;
        }

        //Boton play creados
        fill(255, 255, 255);
        quad(900, 300, 900, 500, 1440, 500, 1440, 300);
        fill(R, G, B);
        textSize(100);
        text("CREADOS", 925, 437.5);
        if (((mouseX>=900 && mouseX<=1440 && mouseY<=500&& mouseY>=300 && mousePressed == true) || keyPressed == true) ) {
          creados=true;
          botones=false;
        }
      }

      if (niveles) {
        //Niv 1
        if (niv==1) {
          pushMatrix();
          fill(255, 255, 255);
          noStroke();
          square(350, 350, 500);
          popMatrix();
        } else {
          if (niv==2) {
            //Niv 2
            pushMatrix();
            fill(255, 255, 255);
            noStroke();
            triangle(680, 404, 1035, 50, 1035, 404);
            triangle(680, 404, 1035, 404, 1035, 758);
            triangle(1210, 490, 1390, 671, 1390, 320);
            quad(1210, 495, 1390, 320, 1390, 140, 1210, 316);
            triangle(1034, 316, 1210, 316, 1034, 142);
            quad(1034, 495, 1034, 316, 1210, 316, 1210, 495);
            triangle(1034, 495, 1210, 495, 1034, 669);
            popMatrix();
          }
        }

        //// Metodos de las figuras ////
        
        pushMatrix();
          Trg.display();
          Trg.mouseSel();
          Trg.mouseClick();
          Trg.rotar();
        popMatrix();
        
        pushMatrix();
          Tvg.display();
          Tvg.mouseSel();
          Tvg.mouseClick();
          Tvg.rotar();
        popMatrix();
        
        pushMatrix();
          Tnm.display();
          Tnm.mouseSel();
          Tnm.mouseClick();
          Tnm.rotar();
        popMatrix();
        
        pushMatrix();
          Tmp.display();
          Tmp.mouseSel();
          Tmp.mouseClick();
          Tmp.rotar();
        popMatrix();
        
        pushMatrix();
          Tcp.display();
          Tcp.mouseSel();
          Tcp.mouseClick();
          Tcp.rotar();
        popMatrix();
        
        pushMatrix();
          Cpa.display();
          Cpa.mouseSel();
          Cpa.mouseClick();
          Cpa.rotar();
        popMatrix();
        
        pushMatrix();
          Pa.display();
          Pa.mouseSel();
          Pa.mouseClick();
          Pa.rotar();
        popMatrix();

      }
    }
  }
}


void comprobacion() {
  pixB=pixelesblancos();
  if (mouseButton==RIGHT) {
    if (pixB<=500) {
      print("victoria");
      fill(255, 255, 255);
      rect(width/2, height/2, 500, 500);
      fill(0, 0, 0);
      text("Siguiente nivel", width/2, height/2 );
      delay(3000);
      niv=niv+1;
    } else {
      fill(0, 0, 0);
      rect(width/2, height/2, 500, 500);
      print(pixB);
    }
  }
  //print("coordenada x", mouseX , "coordenada y", mouseY);
}

int pixelesblancos () {
  loadPixels();
  for (int i=0; i<width*height; i++) {
    color c=pixels[i];
    if (red(c)==255 && green(c)==255 && blue(c)==255) {
      pixB=pixB+1;
    }
  }
  return pixB;
}

void mouseClicked() {

  //MODO CREADOR

  if (mouseSel == "TG1" ) {
    if (movTG1==false) {
      movTG1=true;
      mouseClick = true;
    } else {
      movTG1=false;
      mouseClick = false;
    }
  }
}

void mouseWheel(MouseEvent event) { 

  //MODO CREADOR
  
  if (movTG1) {
    anguloTG1 = anguloTG1 + (event.getCount()*5);
  }
}
