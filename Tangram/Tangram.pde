PImage img;

//Archivos JSON//
JSONObject nivc;
JSONObject nivActual;

////////
Triangle Trg;
Triangle Tvg;
Triangle Tnm;
Triangle Tmp;
Triangle Tcp;
Quad Cpa;
Quad Pa;
////////
//MODO CREADOR FIGURAS//
Triangle TG1;
Triangle TG2;
Triangle TM;
Triangle TP1;
Triangle TP2;
Quad CP;
Quad P;

////// variables de controles de movimiento //////
int PixColor;
float anguloCont;
float acc = 0.7;
//////////////////////////////////////////////////

boolean mouseClick = false;

//variable de victoria 
boolean victoria=false;

//nivel
int niv = 1;
int nivC = 1;
int accionador = 0;

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

//pixeles blancos
int pixB=0;

@Override 
  void setup() {
  size (1650, 875);
  rectMode(CENTER);
  ///Objetos///
  Trg = new Triangle('1', color(255, 0, 0), 1135, 250, -125, 250, -125, -250, 125, 0, 0, false, false);
  Tvg = new Triangle('2', color(0, 255, 0), 1250, 700, -250, -125, 250, -125, 0, 125, 0, false, false);
  Tnm = new Triangle('3', color(255, 153, 0), 1500, 180, 90, -160, -160, 90, 90, 90, 0, false, false);
  Tmp = new Triangle('4', color(200, 0, 255), 800, 500, 0, -62, -125, 63, 125, 63, 0, false, false);
  Tcp = new Triangle('5', color(132, 85, 4), 900, 750, 63, -125, 63, 125, -62, 0, 0, false, false);
  Cpa = new Quad('6', color(255, 255, 0), 1500, 400, 0, -125, 125, 0, 0, 125, -125, 0, 0, false, false);
  Pa = new Quad('7', color(0, 0, 255), 800, 200, -187, 63, 63, 63, 188, -62, -62, -62, 0, false, false);
  
  //MODO CREADOR FIGURAS//
  TG1 = new Triangle('1', color(200, 0, 0), 1135, 250, -125, 250, -125, -250, 125, 0, 0, false, false);
  TG2 = new Triangle('2', color(0, 200, 0), 1250, 700, -250, -125, 250, -125, 0, 125, 0, false, false);
  TM = new Triangle('3', color(200, 100, 0), 1500, 180, 90, -160, -160, 90, 90, 90, 0, false, false);
  TP1 = new Triangle('4', color(150, 0, 200), 800, 500, 0, -62, -125, 63, 125, 63, 0, false, false);
  TP2 = new Triangle('5', color(82, 35, 4), 900, 750, 63, -125, 63, 125, -62, 0, 0, false, false);
  CP = new Quad('6', color(200, 200, 0), 1500, 400, 0, -125, 125, 0, 0, 125, -125, 0, 0, false, false);
  P = new Quad('7', color(0, 0, 200), 800, 200, -187, 63, 63, 63, 188, -62, -62, -62, 0, false, false);
  ////////////
  //JSON Objects//

  nivc= loadJSONObject("data/Niveles_creados");
 
  img = loadImage("table.jpg");
  strokeWeight(2);
}

void draw() {

  background(img);
  stroke(0, 0, 0);
  pixB=0;
  
  ////*******************************
  
  int num_nivc=nivc.getInt("Numero de niveles creados");
  String num_nivC=str(num_nivc+1);

  //*****************************

  //variables colores
  float R=random(255);
  float G=random(255);
  float B=random(255);

  //Menu pricipal 

  if (menu) {
    //Titulo "Tangram"
    fill(238, 225, 127);
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

      //Triangulo Grande 1//
      pushMatrix();
      TG1.display();
      TG1.selec();
      TG1.mouseClick();
      TG1.rotar();
      TG1.tMov();
      popMatrix();

      //Triangulo Grande 2//
      pushMatrix();
      TG2.display();
      TG2.selec();
      TG2.mouseClick();
      TG2.rotar();
      TG2.tMov();
      popMatrix();

      //Triangulo Mediano//
      pushMatrix();
      TM.display();
      TM.selec();
      TM.mouseClick();
      TM.rotar();
      TM.tMov();
      popMatrix();

      //Triangulo Pequeño 1/
      pushMatrix();
      TP1.display();
      TP1.selec();
      TP1.mouseClick();
      TP1.rotar();
      TP1.tMov();
      popMatrix();


      //Triangulo Pequeño 2//
      pushMatrix();
      TP2.display();
      TP2.selec();
      TP2.mouseClick();
      TP2.rotar();
      TP2.tMov();
      popMatrix();

      //Cuadrado pequeño//
      pushMatrix();
      CP.display();
      CP.selec();
      CP.mouseClick();
      CP.rotar();
      CP.tMov();
      popMatrix();

      //Paralelogramo//
      pushMatrix();
      P.display();
      P.selec();
      P.mouseClick();
      P.rotar();
      P.tMov();
      popMatrix();
      
      //Guardar nivel
      //Boton de guardado
      stroke(10, 10, 10);
      fill(255, 255, 0);
      quad(1425, 700, 1425, 600, 1600, 600, 1600, 700);
      fill(0, 0, 0);
      textSize(50);
      text("SAVE", 1450, 670);
      if (((mouseX>=1425 && mouseX<=1600 && mouseY<=700&& mouseY>=600 && mousePressed == true) || keyPressed == true) ) {

        //Guardado en JSON//
        JSONObject nivel;
        nivel= new JSONObject();
        //Triagnulo grande 1//
        nivel.setFloat("TG1X", TG1.xPos);
        nivel.setFloat("TG1Y", TG1.yPos);
        nivel.setFloat("TG1x1", TG1.p1);
        nivel.setFloat("TG1y1", TG1.p2);
        nivel.setFloat("TG1x2", TG1.p3);
        nivel.setFloat("TG1y2", TG1.p4);
        nivel.setFloat("TG1x3", TG1.p5);
        nivel.setFloat("TG1y3", TG1.p6);
        //Triagnulo grande 2//X
        nivel.setFloat("TG2X", TG2.xPos);
        nivel.setFloat("TG2Y", TG2.yPos);
        nivel.setFloat("TG2x1", TG2.p1);
        nivel.setFloat("TG2y1", TG2.p2);
        nivel.setFloat("TG2x2", TG2.p3);
        nivel.setFloat("TG2y2", TG2.p4);
        nivel.setFloat("TG2x3", TG2.p5);
        nivel.setFloat("TG2y3", TG2.p6);
        //Triangulo mediano//
        nivel.setFloat("TMX", TM.xPos);
        nivel.setFloat("TMY", TM.yPos);
        nivel.setFloat("TMx1", TM.p1);
        nivel.setFloat("TMy1", TM.p2);
        nivel.setFloat("TMx2", TM.p3);
        nivel.setFloat("TMy2", TM.p4);
        nivel.setFloat("TMx3", TM.p5);
        nivel.setFloat("TMy3", TM.p6);
        //Triangulo pequeño 1//
        nivel.setFloat("TP1X", TP1.xPos);
        nivel.setFloat("TP1Y", TP1.yPos);
        nivel.setFloat("TP1x1", TP1.p1);
        nivel.setFloat("TP1y1", TP1.p2);
        nivel.setFloat("TP1x2", TP1.p3);
        nivel.setFloat("TP1y2", TP1.p4);
        nivel.setFloat("TP1x3", TP1.p5);
        nivel.setFloat("TP1y3", TP1.p6);
        //Triangulo pequeño 2// 
        nivel.setFloat("TP2X", TP2.xPos);
        nivel.setFloat("TP2Y", TP2.yPos);
        nivel.setFloat("TP2x1", TP2.p1);
        nivel.setFloat("TP2y1", TP2.p2);
        nivel.setFloat("TP2x2", TP2.p3);
        nivel.setFloat("TP2y2", TP2.p4);
        nivel.setFloat("TP2x3", TP2.p5);
        nivel.setFloat("TP2y3", TP2.p6);
        //Cuadrado pequeño//
        nivel.setFloat("CPX", CP.xPos);
        nivel.setFloat("CPY", CP.yPos);
        nivel.setFloat("CPx1", CP.p1);
        nivel.setFloat("CPy1", CP.p2);
        nivel.setFloat("CPx2", CP.p3);
        nivel.setFloat("CPy2", CP.p4);
        nivel.setFloat("CPx3", CP.p5);
        nivel.setFloat("CPy3", CP.p6);
        nivel.setFloat("CPx4", CP.p7);
        nivel.setFloat("CPy4", CP.p8);
        //Paralelpipedo//
        nivel.setFloat("PX", P.xPos);
        nivel.setFloat("PY", P.yPos);
        nivel.setFloat("Px1", P.p1);
        nivel.setFloat("Py1", P.p2);
        nivel.setFloat("Px2", P.p3);
        nivel.setFloat("Py2", P.p4);
        nivel.setFloat("Px3", P.p5);
        nivel.setFloat("Py3", P.p6);
        nivel.setFloat("Px4", P.p7);
        nivel.setFloat("Py4", P.p8);
        saveJSONObject(nivel, "data/"+num_nivC);

        delay(3000);
        num_nivc=num_nivc+1;    //***-*-*-*-*-*-*-*
        nivc.setInt("Numero de niveles creados", num_nivc);
        saveJSONObject(nivc, "data/Niveles_creados");
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
      
      //// niveles por defecto //
      
      if (niveles) {
        comprobar(pixB);
        //Niv 1
        if (niv==1) {
          pushMatrix();
          fill(255, 255, 255);
          noStroke();
          square(350, 350, 500);
          popMatrix();
        } else {
          //Niv 2
          if (niv==2) {
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
        Trg.mouseClick();
        Trg.rotar();
        Trg.selec();
        Trg.tMov();
        popMatrix();
        
        pushMatrix();
        Tvg.display();
        Tvg.mouseClick();
        Tvg.rotar();
        Tvg.selec();
        Tvg.tMov();
        popMatrix();

        pushMatrix();
        Tnm.display();
        Tnm.mouseClick();
        Tnm.rotar();
        Tnm.selec();
        Tnm.tMov();
        popMatrix();

        pushMatrix();
        Tmp.display();
        Tmp.mouseClick();
        Tmp.rotar();
        Tmp.selec();
        Tmp.tMov();
        popMatrix();

        pushMatrix();
        Tcp.display();
        Tcp.mouseClick();
        Tcp.rotar();
        Tcp.selec();
        Tcp.tMov();
        popMatrix();

        pushMatrix();
        Cpa.display();
        Cpa.mouseClick();
        Cpa.rotar();
        Cpa.selec();
        Cpa.tMov();
        popMatrix();

        pushMatrix();
        Pa.display();
        Pa.mouseClick();
        Pa.rotar();
        Pa.selec();
        Pa.tMov();
        popMatrix();
      } else {
        if (creados) {

          comprobar_nivc(pixB);
          
          
          nivActual=loadJSONObject("data/"+str(nivC));

          //Triangulo grande 1//
          pushMatrix();
          translate(int(nivActual.getFloat("TG1X")), int(nivActual.getFloat("TG1Y")));
          stroke(255, 255, 255);
          fill(255, 255, 255);
          triangle(int(nivActual.getFloat("TG1x1")), int(nivActual.getFloat("TG1y1")), int(nivActual.getFloat("TG1x2")), int(nivActual.getFloat("TG1y2")), int(nivActual.getFloat("TG1x3")), int(nivActual.getFloat("TG1y3")));
          popMatrix();

          //Triangulo grande 2//
          pushMatrix();
          translate(int(nivActual.getFloat("TG2X")), int(nivActual.getFloat("TG2Y")));
          stroke(255, 255, 255);
          fill(255, 255, 255);
          triangle(int(nivActual.getFloat("TG2x1")), int(nivActual.getFloat("TG2y1")), int(nivActual.getFloat("TG2x2")), int(nivActual.getFloat("TG2y2")), int(nivActual.getFloat("TG2x3")), int(nivActual.getFloat("TG2y3")));
          popMatrix();

          //Triangulo mediano//
          pushMatrix();
          translate(int(nivActual.getFloat("TMX")), int(nivActual.getFloat("TMY")));
          stroke(255, 255, 255);
          fill(255, 255, 255);
          triangle(int(nivActual.getFloat("TMx1")), int(nivActual.getFloat("TMy1")), int(nivActual.getFloat("TMx2")), int(nivActual.getFloat("TMy2")), int(nivActual.getFloat("TMx3")), int(nivActual.getFloat("TMy3")));
          popMatrix();

          //Triangulo pequeño 1//
          pushMatrix();
          translate(int(nivActual.getFloat("TP1X")), int(nivActual.getFloat("TP1Y")));
          stroke(255, 255, 255);
          fill(255, 255, 255);
          triangle(int(nivActual.getFloat("TP1x1")), int(nivActual.getFloat("TP1y1")), int(nivActual.getFloat("TP1x2")), int(nivActual.getFloat("TP1y2")), int(nivActual.getFloat("TP1x3")), int(nivActual.getFloat("TP1y3")));
          popMatrix();

          //Triangulo pequeño 2//
          pushMatrix();
          translate(int(nivActual.getFloat("TP2X")), int(nivActual.getFloat("TP2Y")));
          stroke(255, 255, 255);
          fill(255, 255, 255);
          triangle(int(nivActual.getFloat("TP2x1")), int(nivActual.getFloat("TP2y1")), int(nivActual.getFloat("TP2x2")), int(nivActual.getFloat("TP2y2")), int(nivActual.getFloat("TP2x3")), int(nivActual.getFloat("TP2y3")));
          popMatrix();

          //Cuadrado pequeño//
          pushMatrix();
          translate(int(nivActual.getFloat("CPX")), int(nivActual.getFloat("CPY")));
          stroke(255, 255, 255);
          fill(255, 255, 255);
          quad(int(nivActual.getFloat("CPx1")), int(nivActual.getFloat("CPy1")), int(nivActual.getFloat("CPx2")), int(nivActual.getFloat("CPy2")), int(nivActual.getFloat("CPx3")), int(nivActual.getFloat("CPy3")), int(nivActual.getFloat("CPx4")), int(nivActual.getFloat("CPy4")));
          popMatrix();

          //Paralelepipedo//
          pushMatrix();
          translate(int(nivActual.getFloat("PX")), int(nivActual.getFloat("PY")));
          stroke(255, 255, 255);
          fill(255, 255, 255);
          quad(int(nivActual.getFloat("Px1")), int(nivActual.getFloat("Py1")), int(nivActual.getFloat("Px2")), int(nivActual.getFloat("Py2")), int(nivActual.getFloat("Px3")), int(nivActual.getFloat("Py3")), int(nivActual.getFloat("Px4")), int(nivActual.getFloat("Py4")));
          popMatrix();

          //// Metodos de las figuras ////

          pushMatrix();
          Trg.display();
          Trg.mouseClick();
          Trg.rotar();
          Trg.selec();
          Trg.tMov();
          popMatrix();
          
          pushMatrix();
          Tvg.display();
          Tvg.mouseClick();
          Tvg.rotar();
          Tvg.selec();
          Tvg.tMov();
          popMatrix();
  
          pushMatrix();
          Tnm.display();
          Tnm.mouseClick();
          Tnm.rotar();
          Tnm.selec();
          Tnm.tMov();
          popMatrix();
  
          pushMatrix();
          Tmp.display();
          Tmp.mouseClick();
          Tmp.rotar();
          Tmp.selec();
          Tmp.tMov();
          popMatrix();
  
          pushMatrix();
          Tcp.display();
          Tcp.mouseClick();
          Tcp.rotar();
          Tcp.selec();
          Tcp.tMov();
          popMatrix();
  
          pushMatrix();
          Cpa.display();
          Cpa.mouseClick();
          Cpa.rotar();
          Cpa.selec();
          Cpa.tMov();
          popMatrix();
  
          pushMatrix();
          Pa.display();
          Pa.mouseClick();
          Pa.rotar();
          Pa.selec();
          Pa.tMov();
          popMatrix();
        }
      }
    }
  }
  
  
  //// reset del contador de direccion del angulo ////
  anguloCont = 0;
  
  //// lector del color del pixel del mouse ////
  PixColor = get(mouseX,mouseY);
  
}

void mouseWheel(MouseEvent event) {
  anguloCont = (event.getCount()*5);
}

void comprobar(int pixB) {
  int pixBl=pixB;
  loadPixels();
  for (int i=0; i<width * height; i++) { 
    color c = pixels[i];
    if (red(c)==255 && green(c)==255 && blue(c)==255) {
      pixBl=+1;
    }
  }
  if (pixBl<=100 && mousePressed && mouseButton==CENTER) {
    niv=niv+1;
    delay(2000);
  }
}

void comprobar_nivc(int pixB) {
  int pixBl=pixB;
  loadPixels();
  for (int i=0; i<width * height; i++) { 
    color c = pixels[i];
    if (red(c)==255 && green(c)==255 && blue(c)==255) {
      pixBl=+1;
    }
  }
  if (pixBl<=100 && mousePressed && mouseButton==CENTER) {
    if(nivC<nivc.getInt("Numero de niveles creados")){
      nivC ++;
    }else{
      nivC = 1;
    }
    println(nivC);
    delay(2000);
  }
}
