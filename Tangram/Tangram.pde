PImage img;
//Archivos JSON//
JSONObject nivc;
JSONObject niva;
JSONObject tg1;



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
float TG1X;
float TG1Y;
float TG1x1;
float TG1x2;
float TG1x3;
float TG1y1;
float TG1y2;
float TG1y3;
Triangle TG2;
float TG2X;
float TG2Y;
float TG2x1;
float TG2x2;
float TG2x3;
float TG2y1;
float TG2y2;
float TG2y3;
Triangle TM;
float TMX;
float TMY;
float TMx1;
float TMx2;
float TMx3;
float TMy1;
float TMy2;
float TMy3;
Triangle TP1;
float TP1X;
float TP1Y;
float TP1x1;
float TP1x2;
float TP1x3;
float TP1y1;
float TP1y2;
float TP1y3;
Triangle TP2;
float TP2X;
float TP2Y;
float TP2x1;
float TP2x2;
float TP2x3;
float TP2y1;
float TP2y2;
float TP2y3;
Quad CP;
float CPX;
float CPY;
float CPx1;
float CPx2;
float CPx3;
float CPx4;
float CPy1;
float CPy2;
float CPy3;
float CPy4;
Quad P;
float PX;
float PY;
float Px1;
float Px2;
float Px3;
float Px4;
float Py1;
float Py2;
float Py3;
float Py4;

String mouseSel;
boolean mouseClick = false;

//variable de victoria 
boolean victoria=false;

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

//pixeles blancos
int pixB=0;

@Override 
  void setup() {
  size (1650, 875);
  rectMode(CENTER);
  ///Objetos///
  Trg = new Triangle(color(255, 0, 0), 1135, 250, -125, 250, -125, -250, 125, 0, 0, false, false, false);
  Tvg = new Triangle(color(0, 255, 0), 1250, 700, -250, -125, 250, -125, 0, 125, 0, false, false, false);
  Tnm = new Triangle(color(255, 153, 0), 1500, 180, 90, -160, -160, 90, 90, 90, 0, false, false, false);
  Tmp = new Triangle(color(200, 0, 255), 800, 500, 0, -62, -125, 63, 125, 63, 0, false, false, false);
  Tcp = new Triangle(color(132, 85, 4), 900, 750, 63, -125, 63, 125, -62, 0, 0, false, false, false);
  Cpa = new Quad(color(255, 255, 0), 1500, 400, 0, -125, 125, 0, 0, 125, -125, 0, 0, false, false, false);
  Pa = new Quad(color(0, 0, 255), 800, 200, -187, 63, 63, 63, 188, -62, -62, -62, 0, false, false, false);
  ////////////
  //MODO CREADOR FIGURAS//
  TG1= new Triangle(color(255, 255, 255), 200, 500, -125, 250, -125, -250, 125, 0, 0, false, false, false);
  TG2= new Triangle(color(255, 255, 255), 325, 300, -250, -125, 250, -125, 0, 125, 0, false, false, false);
  TM= new Triangle(color(255, 255, 255), 500, 700, 90, -160, -160, 90, 90, 90, 0, false, false, false);
  TP1= new Triangle(color(255, 255, 255), 800, 500, 0, -62, -125, 63, 125, 63, 0, false, false, false);
  TP2= new Triangle(color(255, 255, 255), 900, 750, 63, -125, 63, 125, -62, 0, 0, false, false, false);
  CP= new Quad(color(255, 255, 255), 500, 400, 0, -125, 125, 0, 0, 125, -125, 0, 0, false, false, false);
  P= new Quad(color(255, 255, 255), 800, 200, -187, 63, 63, 63, 188, -62, -62, -62, 0, false, false, false);
  ////////////
  //JSON Objects//

  nivc= loadJSONObject("data/Niveles creados");

  img = loadImage("table.jpg");
  strokeWeight(5);
}

void draw() {

  background(img);
  stroke(0, 0, 0);
  pixB=0;
  int num_nivc=nivc.getInt("Numero de niveles creados");
  print(num_nivc);
  String num_nivC=str(num_nivc+1);

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
      TG1.mouseSel();
      TG1.mouseClick();
      TG1.rotar();
      popMatrix();

      //Triangulo Grande 2//
      pushMatrix();
      TG2.display();
      TG2.mouseSel();
      TG2.mouseClick();
      TG2.rotar();
      popMatrix();

      //Triangulo Mediano//
      pushMatrix();
      TM.display();
      TM.mouseSel();
      TM.mouseClick();
      TM.rotar();
      popMatrix();

      //Triangulo Pequeño 1/
      pushMatrix();
      TP1.display();
      TP1.mouseSel();
      TP1.mouseClick();
      TP1.rotar();
      popMatrix();


      //Triangulo Pequeño 2//
      pushMatrix();
      TP2.display();
      TP2.mouseSel();
      TP2.mouseClick();
      TP2.rotar();
      popMatrix();

      //Cuadrado pequeño//
      pushMatrix();
      CP.display();
      CP.mouseSel();
      CP.mouseClick();
      CP.rotar();
      popMatrix();

      //Paralelogramo//
      pushMatrix();
      P.display();
      P.mouseSel();
      P.mouseClick();
      P.rotar();
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
        //Ordenado de coordenadas//
        //Triangulo grande 1//
        TG1X=TG1.darX();
        TG1Y=TG1.darY();
        TG1x1=TG1.darp1();
        TG1x2=TG1.darp3();
        TG1x3=TG1.darp5();
        TG1y1=TG1.darp2();
        TG1y2=TG1.darp4();
        TG1y3=TG1.darp6();
        //Triangulo grande 2//
        TG2X=TG2.darX();
        TG2Y=TG2.darY();
        TG2x1=TG2.darp1();
        TG2x2=TG2.darp3();
        TG2x3=TG2.darp5();
        TG2y1=TG2.darp2();
        TG2y2=TG2.darp4();
        TG2y3=TG2.darp6();
        //Triangulo mediano//
        TMX=TM.darX();
        TMY=TM.darY();
        TMx1=TM.darp1();
        TMx2=TM.darp3();
        TMx3=TM.darp5();
        TMy1=TM.darp2();
        TMy2=TM.darp4();
        TMy3=TM.darp6();
        //Triangulo pequeño 1//
        TP1X=TP1.darX();
        TP1Y=TP1.darY();
        TP1x1=TP1.darp1();
        TP1x2=TP1.darp3();
        TP1x3=TP1.darp5();
        TP1y1=TP1.darp2();
        TP1y2=TP1.darp4();
        TP1y3=TP1.darp6();
        //Triangulo pequeño 2//
        TP2X=TP2.darX();
        TP2Y=TP2.darY();
        TP2x1=TP2.darp1();
        TP2x2=TP2.darp3();
        TP2x3=TP2.darp5();
        TP2y1=TP2.darp2();
        TP2y2=TP2.darp4();
        TP2y3=TP2.darp6();
        //Cuadrado pequeño//
        CPX=CP.darX();
        CPY=CP.darY();
        CPx1=CP.darp1();
        CPx2=CP.darp3();
        CPx3=CP.darp5();
        CPx4=CP.darp7();
        CPy1=CP.darp2();
        CPy2=CP.darp4();
        CPy3=CP.darp6();
        CPy4=CP.darp8();
        //Paralelogramo//
        PX=P.darX();
        PY=P.darY();
        Px1=P.darp1();
        Px2=P.darp3();
        Px3=P.darp5();
        Px4=P.darp7();
        Py1=P.darp2();
        Py2=P.darp4();
        Py3=P.darp6();
        Py4=P.darp8();

        //Guardado en JSON//
        JSONObject Nivel= new JSONObject();
        //Triangulo grande 1//
        JSONObject TG1 =new JSONObject(); 
        TG1.setFloat("X", TG1X);
        TG1.setFloat("Y", TG1Y);
        TG1.setFloat("PX1", TG1x1);
        TG1.setFloat("PY1", TG1y1);
        TG1.setFloat("PX2", TG1x2);
        TG1.setFloat("PY2", TG1y2);
        TG1.setFloat("PX3", TG1x3);
        TG1.setFloat("PY3", TG1y3);
        Nivel.setJSONObject("TG1", TG1);
        //Triangulo grande 2//
        JSONObject TG2 =new JSONObject(); 
        TG2.setFloat("X", TG2X);
        TG2.setFloat("Y", TG2Y);
        TG2.setFloat("PX1", TG2x1);
        TG2.setFloat("PY1", TG2y1);
        TG2.setFloat("PX2", TG2x2);
        TG2.setFloat("PY2", TG2y2);
        TG2.setFloat("PX3", TG2x3);
        TG2.setFloat("PY3", TG2y3);
        Nivel.setJSONObject("TG2", TG2);
        //Triangulo mediano//
        JSONObject TM =new JSONObject(); 
        TM.setFloat("X", TMX);
        TM.setFloat("Y", TMY);
        TM.setFloat("PX1", TMx1);
        TM.setFloat("PY1", TMy1);
        TM.setFloat("PX2", TMx2);
        TM.setFloat("PY2", TMy2);
        TM.setFloat("PX3", TMx3);
        TM.setFloat("PY3", TMy3);
        Nivel.setJSONObject("TM", TM);
        //Triangulo pequeño 1// 
        JSONObject TP1 =new JSONObject(); 
        TP1.setFloat("X", TP1X);
        TP1.setFloat("Y", TP1Y);
        TP1.setFloat("PX1", TP1x1);
        TP1.setFloat("PY1", TP1y1);
        TP1.setFloat("PX2", TP1x2);
        TP1.setFloat("PY2", TP1y2);
        TP1.setFloat("PX3", TP1x3);
        TP1.setFloat("PY3", TP1y3);
        Nivel.setJSONObject("TP1", TP1);
        //Triangulo pequeño 2//
        JSONObject TP2 =new JSONObject(); 
        TP2.setFloat("X", TP2X);
        TP2.setFloat("Y", TP2Y);
        TP2.setFloat("PX1", TP2x1);
        TP2.setFloat("PY1", TP2y1);
        TP2.setFloat("PX2", TP2x2);
        TP2.setFloat("PY2", TP2y2);
        TP2.setFloat("PX3", TP2x3);
        TP2.setFloat("PY3", TP2y3);
        Nivel.setJSONObject("TP2", TP2);
        //Cuadrado pequeño// 
        JSONObject CP= new JSONObject();
        CP.setFloat("X", CPX);
        CP.setFloat("Y", CPY);
        CP.setFloat("PX1", CPx1);
        CP.setFloat("PX2", CPx2);
        CP.setFloat("PX3", CPx3);
        CP.setFloat("PX4", CPx4);
        CP.setFloat("PY1", CPy1);
        CP.setFloat("PY2", CPy2);
        CP.setFloat("PY3", CPy3);
        CP.setFloat("PY4", CPy4);
        Nivel.setJSONObject("CP", CP);
        //Paralelograma// 
        JSONObject P= new JSONObject();
        P.setFloat("X", PX);
        P.setFloat("Y", PY);
        P.setFloat("PX1", Px1);
        P.setFloat("PX2", Px2);
        P.setFloat("PX3", Px3);
        P.setFloat("PX4", Px4);
        P.setFloat("PY1", Py1);
        P.setFloat("PY2", Py2);
        P.setFloat("PY3", Py3);
        P.setFloat("PY4", Py4);
        Nivel.setJSONObject("P", P);

        nivc.setJSONObject(num_nivC, Nivel);
        delay(3000);
        num_nivc=num_nivc+1;
        nivc.setInt("Numero de niveles creados",num_nivc);
        saveJSONObject(nivc, "data/Niveles creados");
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
      } else {
        if (creados) {
          comprobar(pixB);
          String nivel=str(niv);
          while (niv<=num_nivc) {
            niva=nivc.getJSONObject(nivel);
            //Triangulo grande 1//
            tg1=niva.getJSONObject("TG1");
            int TG1X=int(tg1.getFloat("X"));
            pushMatrix();
            translate(int(tg1.getFloat("X")),int(tg1.getFloat("Y")));
            fill(255,255,255);
            triangle(int(tg1.getFloat("PX1")),int(tg1.getFloat("PY1")),int(tg1.getFloat("PX2")),int(tg1.getFloat("PY2")),int(tg1.getFloat("PX3")),int(tg1.getFloat("PY3")));
            popMatrix();
            print(TG1X);
          }
        }
      }
    }
  }
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
  if (pixBl<=100 && mousePressed && mouseButton==RIGHT) {
    niv=niv+1;
    delay(3000);
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
  if (pixBl<=100 && mousePressed && mouseButton==RIGHT) {
    niv=niv+1;
    delay(3000);
  }
}
