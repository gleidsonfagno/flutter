import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';

void main(List<String> arguments) {
  var listaNomes = ["fagno", "josy", "duda"];
  // var texto = "meu codigo for";
  for (var i = 0; i < listaNomes.length; i++) {
    print(listaNomes[i]);
    // Código a ser repetido em cada iteração
  }

  List<int> numeros = [1, 2, 3, 4, 5];

  // for in
  for (var numero in numeros) {
    print(numero);
    print("FOI_in");
    // Código a ser executado para cada elemento
  }

  // forEach
  var letras = ["b", "B", "c", "d"];
  letras.forEach((elemento) {
    print("forEach");
    print(elemento);
    print(letras);
  });

  // enquanto while
  int contador = 1;

  while (contador <= 5) {
    print(contador);
    contador++;
  }

  print("digite um numero ou 'S' para sair");
  var input = stdin.readLineSync(encoding: utf8);
  double acumulador = 0;
  while (input != "s") {
    var numero = double.parse(input ?? "");
    acumulador = acumulador + numero;
    print("digite um numero ou 'S' para sair");
    input = stdin.readLineSync(encoding: utf8);
    exit(0);
  }
  print(acumulador);

  // do whille /faça enquanto
  var opcao = "";
  var finall = 0.0;
  do {
    print("digite 'S' para sair ");
    var line = stdin.readLineSync(encoding: utf8);
    opcao = line ?? "";
    var numeroDigitado = double.tryParse(opcao);
    if(numeroDigitado != null){
      finall = finall + numeroDigitado;
    }
  } while (opcao != "s");
  print(finall);
}
