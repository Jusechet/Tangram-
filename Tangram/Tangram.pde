PImage img;


//Coordenadas triangulo rojo grande puntos iniciales
float xTrg1=1135;
float yTrg1=250;
float anguloTrg = 0;
boolean movTrg=false;
boolean movKeyTrg=false;

//Coordenadas triangulo verde grande puntos iniciales
float xTvg1=1250;
float yTvg1=700;
float anguloTvg=0;
boolean movTvg=false;
boolean movKeyTvg=false;

//Coordenadas triangulo naranja mediano puntos iniciales 
float xTnm1=1500;
float yTnm1=180;
float anguloTnm = 0;
boolean movTnm=false;
boolean movKeyTnm=false;

//Coordenadas paralelpipedo azul puntos iniciales 
float xPa1=800;
float yPa1=200;
float anguloPa = 0;
boolean movPa=false;
boolean movKeyPa=false;

//Coordenadas triangulo morado pequeño puntos iniciales 
float xTmp1=800;
float yTmp1=500;
float anguloTmp = 0;
boolean movTmp=false; 
boolean movKeyTmp=false;

//Coordenadas cuadrado pequeño amarillo puntos iniciales
float xCpa1=1500;
float yCpa1=400;
float anguloCpa = 0;
boolean movCpa=false; 
boolean movKeyCpa=false; 

//Coordenadas triangulo cafe pequeño puntos iniciales 
float xTcp1=900;
float yTcp1=750;
float anguloTcp = 0;
boolean movTcp=false; 
boolean movKeyTcp=false; 

//figura que selecciona el mouse
String mouseSel= "none";
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


        //////Triangulo rojo grande//////
        pushMatrix();
        if (movTrg) {
          xTrg1 = mouseX;
          yTrg1 = mouseY;
          stroke(140, 0, 0);
        } else {
          stroke(255, 0, 0);
        }
        translate(xTrg1, yTrg1);
        fill(255, 0, 0);
        rotate(radians(anguloTrg));
        triangle(-125, 250, -125, -250, 125, 0);

        //circulo inscrito en Trg
        fill(0, 0, 0);
        circle(0, 0, 20);
        popMatrix();

        //////Triangulo verde grande//////
        pushMatrix();
        if (movTvg) {
          xTvg1 = mouseX;
          yTvg1 = mouseY;
          stroke(0, 140, 0);
        } else {
          stroke(0, 255, 0);
        }
        translate(xTvg1, yTvg1);
        fill(0, 255, 0);
        rotate(radians(anguloTvg));
        triangle(-250, -125, 250, -125, 0, 125);

        //circulo inscrito en Tvg
        fill(0, 0, 0);
        circle(0, 0, 20);
        popMatrix();  

        //////Triangulo naranja mediano//////
        pushMatrix();
        if (movTnm) {
          xTnm1 = mouseX;
          yTnm1 = mouseY;
          stroke(190, 115, 0);
        } else {
          stroke(255, 153, 0);
        }
        translate(xTnm1, yTnm1);
        fill(255, 153, 0);
        rotate(radians(anguloTnm));
        triangle(90, -160, -160, 90, 90, 90);

        //circulo inscrito en Tnm
        fill(0, 0, 0);
        circle(0, 0, 20);
        popMatrix();

        //////Paralelpipedo azul //////
        pushMatrix();
        if (movPa) {
          xPa1 = mouseX;
          yPa1 = mouseY;
          stroke(100, 110, 255);
        } else {
          stroke(0, 0, 255);
        }
        translate(xPa1, yPa1);
        fill(0, 0, 255);
        rotate(radians(anguloPa));
        quad(-187, 63, 63, 63, 188, -62, -62, -62);

        //circulo inscrito en Pa
        fill(0, 0, 0);
        circle(0, 0, 20);
        popMatrix();

        //////Triangulo morado pequeño//////
        pushMatrix();
        if (movTmp) {
          xTmp1 = mouseX;
          yTmp1 = mouseY;
          stroke(100, 0, 140);
        } else {
          stroke(199, 0, 255);
        }
        translate(xTmp1, yTmp1);
        fill(199, 0, 255);
        rotate(radians(anguloTmp));
        triangle(0, -62, -125, 63, 125, 63);

        //circulo inscrito en Tmp
        fill(0, 0, 0);
        circle(0, 0, 20);
        popMatrix();

        //////Cuadrado pequeño amarillo//////
        pushMatrix();
        if (movCpa) {
          xCpa1 = mouseX;
          yCpa1 = mouseY;
          stroke(140, 140, 0);
        } else {
          stroke(255, 255, 0);
        }
        translate(xCpa1, yCpa1);
        fill(255, 255, 0);
        rotate(radians(anguloCpa));
        quad(0, -125, 125, 0, 0, 125, -125, 0);

        //circulo inscrito en Cpa
        fill(0, 0, 0);
        circle(0, 0, 20);
        popMatrix();

        //////Triangulo cafe pequeño//////
        pushMatrix();
        if (movTcp) {
          xTcp1 = mouseX;
          yTcp1 = mouseY;
          stroke(140, 25, 25);
        } else {
          stroke(132, 85, 4);
        }
        translate(xTcp1, yTcp1);
        fill(132, 85, 4);
        rotate(radians(anguloTcp));
        triangle(63, -125, 63, 125, -62, 0);

        //circulo inscrito en Tcp
        fill(0, 0, 0);
        circle(0, 0, 20);
        popMatrix();

        //Ciclo if seleccion figura en mouse

        if (mouseClick == false) {
          if ((sqrt(sq(mouseX-xTrg1)+sq(mouseY-yTrg1))) <= 15 ) {
            mouseSel="trg";
            cursor(HAND);
          } else {
            if ((sqrt(sq(mouseX-xTvg1)+sq(mouseY-yTvg1))) <= 15 ) {
              mouseSel="tvg";
              cursor(HAND);
            } else {
              if ((sqrt(sq(mouseX-xTnm1)+sq(mouseY-yTnm1))) <= 15 ) {
                mouseSel="tnm";
                cursor(HAND);
              } else {
                if ((sqrt(sq(mouseX-xPa1)+sq(mouseY-yPa1))) <= 15 ) {
                  mouseSel="pa";
                  cursor(HAND);
                } else {
                  if ((sqrt(sq(mouseX-xTmp1)+sq(mouseY-yTmp1))) <= 15 ) {
                    mouseSel="tmp";
                    cursor(HAND);
                  } else {
                    if ((sqrt(sq(mouseX-xCpa1)+sq(mouseY-yCpa1))) <= 15 ) {
                      mouseSel="cpa";
                      cursor(HAND);
                    } else {
                      if ((sqrt(sq(mouseX-xTcp1)+sq(mouseY-yTcp1))) <= 15 ) {
                        mouseSel="tcp";
                        cursor(HAND);
                      } else {
                        if (mouseButton==RIGHT) {
                          comprobacion();
                        } else {
                          cursor(ARROW);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
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

  //MODO NORMAL
  if (mouseSel == "trg" ) {
    if (movTrg==false) {
      movTrg=true;
      mouseClick = true;
    } else {
      movTrg=false;
      mouseClick = false;
    }
  }

  if (mouseSel == "tvg") {
    if (movTvg==false) {
      movTvg=true;
      mouseClick = true;
    } else {
      movTvg=false;
      mouseClick = false;
    }
  }

  if (mouseSel == "tnm") {
    if (movTnm==false) {
      movTnm=true;
      mouseClick = true;
    } else {
      movTnm=false;
      mouseClick = false;
    }
  }

  if (mouseSel == "pa") {
    if (movPa==false) {
      movPa=true;
      mouseClick = true;
    } else {
      movPa=false;
      mouseClick = false;
    }
  }

  if (mouseSel == "tmp") {
    if (movTmp==false) {
      movTmp=true;
      mouseClick = true;
    } else {
      movTmp=false;
      mouseClick = false;
    }
  }

  if (mouseSel == "cpa") {
    if (movCpa==false) {
      movCpa=true;
      mouseClick = true;
    } else {
      movCpa=false;
      mouseClick = false;
    }
  }

  if (mouseSel == "tcp") {
    if (movTcp==false) {
      movTcp=true;
      mouseClick = true;
    } else {
      movTcp=false;
      mouseClick = false;
    }
  }
}


void mouseWheel(MouseEvent event) { 

  //MODO CREADOR
  
  if (movTG1) {
    anguloTG1 = anguloTG1 + (event.getCount()*5);
  }
  
  //MODO NORMAL
  
  if (movTrg) {
    anguloTrg = anguloTrg + (event.getCount()*5);
  }

  if (movTvg) {
    anguloTvg = anguloTvg + (event.getCount()*5);
  }

  if (movTnm) {
    anguloTnm = anguloTnm + (event.getCount()*5);
  }

  if (movPa) {
    anguloPa = anguloPa + (event.getCount()*5);
  }

  if (movTmp) {
    anguloTmp = anguloTmp + (event.getCount()*5);
  }

  if (movCpa) {
    anguloCpa = anguloCpa + (event.getCount()*5);
  }

  if (movTcp) {
    anguloTcp = anguloTcp + (event.getCount()*5);
  }
}

void keyPressed() {
  if (key == 'r' ) {
    if (movKeyTrg==false) {
      movKeyTrg=true;
    } else {
      movKeyTrg=false;
    }
  }

  if (key == 'v' ) {
    if (movKeyTvg==false) {
      movKeyTvg=true;
    } else {
      movKeyTvg=false;
    }
  }

  if (key == 'n' ) {
    if (movKeyTnm==false) {
      movKeyTnm=true;
    } else {
      movKeyTnm=false;
    }
  }

  if (key == 'a' ) {
    if (movKeyPa==false) {
      movKeyPa=true;
    } else {
      movKeyPa=false;
    }
  }

  if (key == 'm' ) {
    if (movKeyTmp==false) {
      movKeyTmp=true;
    } else {
      movKeyTmp=false;
    }
  }

  if (key == 'q' ) {
    if (movKeyCpa==false) {
      movKeyCpa=true;
    } else {
      movKeyCpa=false;
    }
  }

  if (key == 'c' ) {
    if (movKeyTcp==false) {
      movKeyTcp=true;
    } else {
      movKeyTcp=false;
    }
  }

  ///movimiento Trg///
  if (movKeyTrg && keyCode == UP) {
    yTrg1--;
  }
  if (movKeyTrg && keyCode == LEFT) {
    xTrg1--;
  }
  if (movKeyTrg && keyCode == DOWN) {
    yTrg1++;
  }
  if (movKeyTrg && keyCode == RIGHT) {
    xTrg1++;
  }
}
