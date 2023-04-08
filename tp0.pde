// Valentin Yuge 92715/7 Comision 3 TP0
  PImage imagen;
void setup(){ 
  size(800,400);
  imagen = loadImage("data/yo.png");
 
}

void draw() {
  background(150);
  image(imagen, 400, 0, 400, 400);
    //buzoatras
  fill(160,19,19);
  triangle(80,220,320,220,200,500);
  //peloatras
  fill(131,98,29);
  bezier(100,230,10,-20,380,-20,300,230);
  line(100,230,300,230);
  //cuello
  fill(247,207,167);
  triangle(170,300,230,300,200,100);
  //cabeza
  fill(247,207,167);
  ellipse(200,140,170,190);
  //ojos
  fill(255);
  ellipse(170,120,35,20);
  ellipse(230,120,35,20);
  fill(124,16,43);
  ellipse(170,120,20,20);
  ellipse(230,120,20,20);
  fill(255);
  ellipse(229,120,5,5);
  ellipse(170,120,5,5);
  //nariz
  strokeWeight(2);
  line(195,140,190,165);
  line(205,140,210,165);
  line(205,165,210,165);
  line(195,165,190,165);
  //boca
  fill(216,192,200);
  ellipse(200,200,40,20);
  fill(193,137,137);
  ellipse(200,200,40,10);
  //peloadelante
  fill(131,98,29);
  bezier(100,100,120,20,300,20,300,105);
  strokeWeight(2);
  line(278,101,122,101);
 //buzo
 fill(10,50,10);
 bezier(0,400,60,240,340,240,400,400);
 //remera
 fill(255);
 ellipse(200,290,98,30);
 triangle(200,380,250,285,150,285);
}
