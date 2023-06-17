 
  void dibujoArte(){
  for (int i = 0; i < 30 ; i++){
    rotate(radians(mover));
    rectMode(CENTER);
    float tamaño = map(i,0,29,400,100);
    fill( i%2*255);
    rect (0, 0, tamaño, tamaño);   
    scale(0.9);   
  }
}

  void invertirColores(){
    blendMode (DIFFERENCE);
    triangle(600,200,400,400,400,0);
    triangle(600,200,800,400,800,0);
  
  
}
