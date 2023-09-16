// import 'calculadora.dart';

void main(List<String> arguments) {
  printData("meu texto");
  print(soma(2, 5).toString());
}

printData(String texto) => print(texto); //posse tira a tipagem (String texto) fica dinamico

soma(int numero1, int numero2) => numero1 + numero2;
