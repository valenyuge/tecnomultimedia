// Valentin Sebastian Yuge 92715/7 TP2 Comision 3
// https://youtu.be/CV_dpaX-kw8

PImage img;
float mover;

void setup() {
  size(800, 400);
  img = loadImage("data/imagen.jpg");
}

void draw() {
  background(255);
  image (img, 0, 0, 400, 400);
  invertirColores();
  translate(600,200);
  dibujoArte();
  if (mouseX>400){
    mover+=0.1;
  }
  
  

}
void mouseClicked(){
mover=0;
}
