void planillabase(int pantalla) {
  image(img[pantalla], 0, 0);
  fill(255, 150);
  if (numeroactual != 0 && numeroactual != img.length) {
    rect(3, 3, 593, 100);
    fill(0);
    textSize(20);
    text(texto[pantalla], 10, 10, 570, 100);
  } else if (numeroactual == 0) {
    textSize(40);
    fill(255);
    text("Los 3 Cerditos", 20, 40);
    rect(225, 225, 150, 50);
    rect(225, 300, 150, 50);
    fill(0);
    textSize(30);
    text("Empezar", 245, 260);
    text("Créditos", 250, 335);
  } else if (numeroactual == img.length - 1) {
    textSize(30);
    fill(255);
    text("Código de: Valentin Yuge\nImágenes de: Los 3 cerditos.", 60, 150);
    rect(450, 450, 100, 50);
    fill(0);
    text("Volver", 460, 485);
  }
}
