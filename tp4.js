//Valentin Sebastian Yuge 92715/7 Comision 5
//https://youtu.be/UY9vltX63i0

// pelota
let pelotaX, pelotaY;
let velocidadX, velocidadY;
// paletas
let paletaIzquierdaY, paletaDerechaY;
const anchoPaleta = 10;
const altoPaleta = 150;
const velocidadPaleta = 5;
// bot
let botY;
const velocidadBot = 5; 
// marcador
let puntosJugador = 0;
let puntosBot = 0;
// timer
let timer = 60; 
// pantalla
let estadoJuego = "inicio";
let estadoInstrucciones = false;

function setup() {
  createCanvas(1877, 958);
  
  textSize(32);
  textAlign(CENTER, CENTER);
  inicioJuego(); // inicia el juego
}

function draw() {
  if (estadoJuego === "juego") {
    background(0);
    
// mueve el bot
if (pelotaX > width / 2) {
  if (abs(pelotaY - paletaDerechaY - altoPaleta / 2) > 50) {
    const t = 0.05; 
    botY = lerp(botY, height / 2 - altoPaleta / 2, t);
  } else {
    if (pelotaY < paletaDerechaY + altoPaleta / 2) {
      paletaDerechaY -= velocidadBot;
    } else if (pelotaY > paletaDerechaY + altoPaleta / 2) {
      paletaDerechaY += velocidadBot;
    }
  }
}
    // dibuja las paletas
    fill(255);
    noStroke();
    rect(0, paletaIzquierdaY, anchoPaleta, altoPaleta);
    rect(width - anchoPaleta, paletaDerechaY, anchoPaleta, altoPaleta);
    
    // dibuja la pelota
    ellipse(pelotaX, pelotaY, 20, 20);
    
    // mueve las paletas
    moverPaleta();
    
    // mueve la pelota
    pelotaX += velocidadX;
    pelotaY += velocidadY;
    
    // colisiones de las paletas
    if (pelotaX < anchoPaleta && pelotaY > paletaIzquierdaY && pelotaY < paletaIzquierdaY + altoPaleta) {
      velocidadX *= -1;
      velocidadX += random(-0.5, 2); 
      velocidadY += random(-0.5, 2); 
    }
    if (pelotaX > width - anchoPaleta && pelotaY > paletaDerechaY && pelotaY < paletaDerechaY + altoPaleta) {
      velocidadX *= -1;
      velocidadX += random(-0.5, 1); 
      velocidadY += random(-0.5, 1); 
    }
    
    // colisiones paredes
    if (pelotaY < 0 || pelotaY > height) {
      velocidadY *= -1;
    }
    
    // puntos
    if (pelotaX < 0) {
      puntosBot++;
      if (puntosBot === 7 || timer <= 0) {
        estadoJuego = "fin";
      } else {
        resetPelota();
        generarVelocidadInicial();
      }
    }
    if (pelotaX > width) {
      puntosJugador++;
      if (puntosJugador === 7 || timer <= 0) {
        estadoJuego = "fin";
      } else {
        resetPelota();
        generarVelocidadInicial();
      }
    }
    
    // tiempo
    if (frameCount % 60 == 0 && timer > 0) {
      timer--;
    }
    
    // mostrar marcador y timer
    textSize(32);
    fill(255);
    text(puntosJugador + "-" + puntosBot, width / 2, 40);
    text("Tiempo: " + timer + " s", width / 2, height - 20);
    
    // pelota entra
    if (pelotaX < 0 || pelotaX > width) {
      resetPelota();
   
    }
    
    // bot controlando la paleta derecha
    if (velocidadX > 0 && pelotaX > width / 2) {
      botY = lerp(botY, pelotaY - altoPaleta / 2, 0.1);
    }
  } else if (estadoJuego === "inicio") {
    if (estadoInstrucciones) {
      // menu de instrucciones
      background(0);
      fill(255);
      text("Instrucciones:", width / 2, height / 3 - 40);
      text("Mueve tu paleta con las teclas W y S.", width / 2, height / 3);
      text("Tenes 60 segundos para lograr la mayor cantidad de puntos, el primero en llegar a 7 gana", width /2, height / 3 + 40);
      text("Presiona I para volver atrás", width / 2, 2 * height / 3 + 40);
      text("Presiona ENTER para iniciar el juego.", width / 2, 2 * height / 3);
    } else {
      // pantalla de inicio
      background(0);
      fill(255);
      text("Pong Game", width / 2, height / 3);
      text("Presiona I para ver las instrucciones", width / 2, 2 * height / 3);
      text("Presiona ENTER para iniciar el juego", width / 2, 3 * height / 4);
    }
  } else if (estadoJuego === "fin") {
    // pantalla de fin de juego
    background(0);
    fill(255);
    let resultado = "";
    if (puntosJugador > puntosBot) {
      resultado = "¡Ganaste!";
    } else if (puntosBot > puntosJugador) {
      resultado = "¡Perdiste!";
    } else {
      resultado = "Empate";
    }
    text(resultado, width / 2, height / 3);
    text("Puntos: " + puntosJugador + "-" + puntosBot, width / 2, 2 * height / 3);
    text("Presiona ENTER para volver a jugar", width / 2, 3 * height / 4);
  }
}
