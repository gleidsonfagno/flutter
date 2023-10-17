import 'dart:math';

class GeradorNumeroAleatorioServices {
  static int geraNumeroAleatorio(int numeroMaximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numeroMaximo);
  }

}