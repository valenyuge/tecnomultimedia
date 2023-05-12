//Valentin Yuge 92715/7 Comision 3 TP1

String estado = "inicio";
int timer = 0;
int imgX, imgY;
PImage img1, img2, img3;

void setup() {
  size(640, 480);
  img1 = loadImage("data/imagen1.jpg");
  img2 = loadImage("data/imagen2.jpg");
  img3 = loadImage("data/imagen3.jpg");
  imgX = width;
}

void draw() {
  background(200);
  if (estado.equals("inicio")) {
    
    //pantalla de inicio
    fill(0,255,0);
    ellipse (320, 240, 300, 300);
    textAlign(CENTER, CENTER);
    textSize(28);
    fill(0);
    text("Haz click para comenzar", width/2, height/2);

   
  } else if (estado.equals("pantalla 1")) {
    //pantalla 1
    image(img1, imgX, imgY);
    imgY = 40;
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    text("'Rain Room' de Random International", width - imgX - img1.width/2, height - 50);
    if (imgX > -img1.width) {
      imgX -= 2;
    } else {
      timer++;
      if (timer>=150) {
        estado = "pantalla 2";
        imgX = width;
        timer = 0;
      }
    }
  } else if (estado.equals("pantalla 2")) {
    //pantalla 2
    image(img2, imgX, imgY);
    imgY = 40;
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    text("'The Clock' de Christian Marclay", width - imgX - img2.width/2, height - 50);
    if (imgX > -img2.width) {
      imgX -= 2;
    } else {
      timer++;
      if (timer>=150) {
        estado = "pantalla 3";
        imgX = width;
        timer = 0;
      }
    }
  } else if (estado.equals("pantalla 3")) {
    //pantalla 3
    image(img3, imgX, imgY);
    imgY = 40;
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    text("'The Wave' de Clifford Ross", width - imgX - img3.width/2, height - 50);
    if (imgX > -img3.width) {
      imgX -= 2;
    } else {
      timer++;
      if (timer>=150) {
        estado = "reinicio";
        imgX = 0;
        timer = 0;
      }
    }
  } else if (estado.equals("reinicio")) {
    //pantalla de reinicio
    fill(255,0,0);
    ellipse (320, 240, 300, 300);
    textAlign(CENTER, CENTER);
    textSize(28);
    fill(0);
    text("Haz click para reiniciar", width/2, height/2);
  }
}
void mousePressed() {
  if (estado.equals("inicio")) {
    if (dist(mouseX,mouseY,320,240)<150) {
      estado = "pantalla 1";
      timer = 0;
      imgX = width;
    }
  } else if (estado.equals("pantalla 1")) {
    estado = "pantalla 2";
    timer = 0;
    imgX = width;
  } else if (estado.equals("pantalla 2")) {
    estado = "pantalla 3";
    timer = 0;
    imgX = width;
  } else if (estado.equals("pantalla 3")){
    estado = "reinicio";
  } else if (estado.equals("reinicio")) {
    if (dist(mouseX,mouseY,320,240)<150) {
      estado = "inicio";
      timer = 0;
      imgX = width;
    }
  }
}
