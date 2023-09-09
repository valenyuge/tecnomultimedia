function keyPressed() {
  if (keyCode === ENTER) {
    if (estadoJuego === "inicio" || estadoJuego === "fin") {
      estadoJuego = "juego";
      inicioJuego();
    }
  } else if (keyCode === 73 && estadoJuego === "inicio") { // tecla "I" para mostrar instrucciones
    estadoInstrucciones = !estadoInstrucciones; // alterna entre mostrar y ocultar instrucciones
  }
}

function inicioJuego() {
  // posición de la pelota y la velocidad
  pelotaX = width / 2;
  pelotaY = height / 2;
  generarVelocidadInicial();
  
  // posición de las paletas
  paletaIzquierdaY = paletaDerechaY = height / 2 - altoPaleta / 2;
  
  // posición del bot
  botY = height / 2 - altoPaleta / 2;
  
  loop();
}

function resetPelota() {
  // reinicia la pelota en el medio y baja la velocidad
  pelotaX = width / 2;
  pelotaY = height / 2;
  velocidadX *= 0.7;
  velocidadY *= 0.7;
}

function generarVelocidadInicial() {
  // genera velocidades aleatorias
  velocidadX = random(3, 5) * (random() > 0.6 ? 1 : -1); 
  velocidadY = random(3, 5) * (random() > 0.6 ? 1 : -1); 
}

function moverPaleta() {
  // mueve la paleta del jugador
  if (keyIsDown(87)) { // W
    paletaIzquierdaY -= velocidadPaleta;
  }
  if (keyIsDown(83)) { // S
    paletaIzquierdaY += velocidadPaleta;
  }
  paletaIzquierdaY = constrain(paletaIzquierdaY, 0, height - altoPaleta);
  
  // el bot mueve la paleta derecha
  paletaDerechaY = botY;
}
