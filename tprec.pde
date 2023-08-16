// Valentin Sebastian Yuge 92715/7 TPrec Comision 3
// https://youtu.be/ihpA0QvSOZs

PFont fuente;  
PImage[] img = new PImage[19];
int[] pantallas = new int[19];
String[] texto;
int minumero;
int numeroactual = 0;

void setup() {
  size(600, 600);
  fuente = createFont("Times New Roman", 48);
  textFont(fuente);
  for (int i = 0; i < img.length; i++) {
    img[i] = loadImage("img" + i + ".png");
  }
    texto = new String[img.length];
  texto[0] = "";  
  texto[1] = "Habia una vez 3 cerditos que vivian con su madre y decidieron construir sus casas. El primer cerdito, el mas joven y flojo, decidio hacerla de paja ya que era mas rapido y facil";
  texto[2] = "El segundo cerdito, un poco mas responsable, decidio hacerla de madera para que sea un poco mas resistente que la de su hermano pequeño";
  texto[3] = "El tercer cerdito, el mas responsable e inteligente, eligio hacerla de ladrillos aunque le tome mucho mas tiempo ya que seria mucho mas resistente";
  texto[4] = "Los 3 cerditos comenzaron a construir sus casas. El primer en terminar fue el mas pequeño que la construyo rapidamente y tuvo mucho tiempo para divertirse";
  texto[5] = "El segundo termino luego de cortar y juntar toda la madera para su casa para luego poder construirla sin tanto problema";
  texto[6] = "Por ultimo, el tercer cerdito fue el ultimo en terminar su casa luego de ir haciendola ladrillo a ladrillo con mucho esfuerzo";
  texto[7] = "¿Que hacen los cerditos?                                                                            A. Ir a jugar al bosque                                                                             B. Quedarse en sus casas";
  texto[8] = "Los cerditos estabas jugando en el bosque, cuando de repente un lobo feroz aparece e intenta comerse a los cerditos. Estos logran escapar a sus casas para refugiarse cada uno en su casa";
  texto[9] = "El lobo los persiguió llegando a la casa del primer cerdito, quien tenia una casa debil de paja. El lobo comenzo a soplar y logro derrumbar su casa por lo que huyo a la casa de su hermano";
  texto[10] = "El lobo fue detras de el y al llegar a la casa, que era de madera, comenzo a soplar con mucha fuerza logrando derrumbarla y haciendo que ambos cerditos huyan hasta la casa de su hermano mayor";
  texto[11] = "Por ultimo, el lobo llega a la casa del tercer cerdito, la de ladrillo. Sopló con todas sus fuerzas pero no pudo derrumbar la casa ya que esta era muy solida, por lo que el lobo tuvo que buscar otra alternativa";
  texto[12] = "El lobo intento abrir la puerta, pero sin mucho éxito, se puso a pensar que hacer";
  texto[13] = "¿Que hace el lobo?                                                                                A. Se trepa por la chimenea                                                                            B. Se rinde y se va";
  texto[14] = "El lobo, tras no encontrar una manera de entrar se rindió y dejo a los cerditos en paz pero prometió volver";
  texto[15] = "El lobo comienza a trepar por la chimnea para entrar, pero el tercer cerdito habia dejado una olla con agua hirviendo debajo";
  texto[16] = "El lobo, sorprendido, cae en la olla y con mucho dolor huye de la casa de los cerditos prometiendo no volver a molestarlos nunca mas";
  texto[17] = "Con esto, los cerditos aprendieron una valiosa lección, gracias a su hermano mayor, las cosas necesitan de tiempo y esfuerzo para que salgan bien, no siempre se puede hacer todo a la ligera";
  texto[18] = "Los cerditos vivieron felices en su nueva casa y no tuvieron ningun problema";
  
}

void draw() {
  if (numeroactual < img.length) {
    planillabase(numeroactual);
  }
  if (numeroactual == img.length + 1) {
    numeroactual = 0;
  }
  fill(0);
  if (numeroactual == 7 || numeroactual == 13) {
    float d = dist(width / 2, height / 2, mouseX, mouseY);
    float maxDist = dist(0, 0, 2 * width, height / 2);
    float miColor = map(d, 0, maxDist, 10, 50);
    fill(miColor);
    rect(100, 450, 50, 50);
    rect(450, 450, 50, 50);
    fill(255);
    textSize(35);
    text("A", 112, 487);
    text("B", 465, 487);
  }
  if (numeroactual == 18) {
    float d = dist(width / 2, height / 2, mouseX, mouseY);
    float maxDist = dist(0, 0, 2 * width, height / 2);
    float miColor = map(d, 0, maxDist, 10, 50);
    fill(miColor);
    rect(225, 500, 150, 50);
    fill(255);
    textSize(35);
    text("Reiniciar", 240, 540);
  }
}

void mousePressed() {
  if (numeroactual == img.length) {
    if (boton(450, 500, 450, 500, 1)) {
      numeroactual = 0;
    }
  } else if (numeroactual == 0) {
    if (boton(245, 395, 240, 290, 1)) {
      numeroactual++;
    } else if (boton(225, 375, 300, 350, 2)) {
      numeroactual = img.length - 1;
    }
  } else {
    if (numeroactual == 18) {
      if (boton(0, 600, 0, 600, 1)) {
        numeroactual = 0;
      }
    } else if (numeroactual == 7) {
      if (boton(100, 150, 450, 500, 1)) {
        numeroactual = 8;
      } else if (boton(450, 500, 450, 500, 2)) {
        numeroactual = 18;
      }
    } else if (numeroactual == 13) {
      if (boton(100, 150, 450, 500, 1)) {
        numeroactual = 15;
      } else if (boton(450, 500, 450, 500, 2)) {
        numeroactual = 14;
      }
    } else if (numeroactual == 14) {
      if (boton(0, 600, 0, 600, 1)) {
        numeroactual = 18;
      }
    } else {
      if (boton(0, 600, 0, 600, 1)) {
        numeroactual++;
      }
    }
  }
}

boolean boton(int posicionx1, int posicionx2, int posiciony1, int posiciony2, int elnumero) {
  int miposicionx1 = posicionx1;
  int miposicionx2 = posicionx2;
  int miposiciony1 = posiciony1;
  int miposiciony2 = posiciony2;
  minumero = elnumero;

  for (int i = 0; i < 19; i++) {
    pantallas[i] = 1;
    pantallas[minumero] = 0;
  }

  return (mouseX > miposicionx1 && mouseX < miposicionx2 && mouseY > miposiciony1 && mouseY < miposiciony2);
}
