// calculadora usando funcao

import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("bem vindo a calculadora");

  var numero1 = lerConsoleDouble("digite um numero");
  // print(numero1);

  // print("digite outro numero");
  // var n2 = stdin.readLineSync(encoding: utf8);
  var numero2 = lerConsoleDouble("digite outro numero");
  // print(numero2);
  // print("informe a operaçao matematica [+, -, *, /");
  // var operador = stdin.readLineSync(encoding: utf8);
  var operacao = lerConsole("informe a operaçao matematica [+, -, *, /");
  // print(operacao);

  // essa funcao ta sendo chamada
  calcular(operacao, numero1, numero2);
}

// essa funça vai ser a de calcular
void calcular(String operacao, double numero1, double numero2) {
  double resultado = 0;
  switch (operacao) {
    case "+":
      resultado = soma(numero1, numero2);
      print(resultado);
      break;
    case "-":
      resultado = subtracao(numero1, numero2);
      print(resultado);
      break;
    case "*":
      resultado = multiplicacao(numero1, numero2);
      print(resultado);
      break;
    case "/":
      resultado = divisao(numero1, numero2);
      print(resultado);
      break;
    default:
      print("operacao invalida");
      exit(0);
  }
  print("opercao solicitada foi: $operacao");
}

double lerConsoleDouble(String texto) {
  var numero = double.tryParse(lerConsole(texto));
  if (numero == null) {
    print("formato  incorreto, alterando para 0");
    return 0.0;
  } else {
    return numero;
  }
}

// essa funçao esta formatando os dados que  o usuario digitou
String lerConsole(String texto) {
  // essa funçao tem um parametro que do print quando ela e chmada depois ele e printado e vai para as outras funcoes qur fotmata os dados
  print(texto); //vai printa qunado eu chamda a funçao
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}

// cada uma da funcoes abaixo fai fazer o calculo qunado ser chamada
double soma(double numero1, double numero2) {
  return numero1 + numero2;
}

double subtracao(double numero1, double numero2) {
  return numero1 - numero2;
}

double multiplicacao(double numero1, double numero2) {
  return numero1 * numero2;
}

double divisao(double numero1, double numero2) {
  // caso o nummero1 for  nao da pra dividor por 0
  if (numero2 == 0) {
    print("Nao e possivel dividir por 0");
    exit(0);
  } else {
    return numero1 / numero2;
  }
  // return numero1 / numero2;
}
