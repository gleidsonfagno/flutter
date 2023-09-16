import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("bem vindo a calculadora");

  print("digite um numero");
  var n1 = stdin.readLineSync(encoding: utf8);
  var numero1 = double.parse(n1 ?? "0");
  print(numero1);
  print("digite outro numero");
  var n2 = stdin.readLineSync(encoding: utf8);
  var numero2 = double.parse(n2 ?? "0");
  print(numero2);
  print("informe a operaçao matematica [+, -, *, /");
  var operador = stdin.readLineSync(encoding: utf8);
  var operacao = operador ?? "";
  print(operacao);

  double resultado = 0;
  switch (operacao) {
    case "+":
      resultado = numero1 + numero2;
      print(resultado);
      break;
    case "-":
      resultado = numero1 - numero2;
      print(resultado);
      break;
    case "*":
      resultado = numero1 * numero2;
      print(resultado);
      break;
    case "/":
      resultado = numero1 / numero2;
      print(resultado);
      break;
    default:
      print("operacao invalida");
      exit(0);
  }
  String dados = "";
  double soma = 0;
  if (operacao == "+") {
    soma = numero1 + numero2;
    dados = "soma";
    print(soma);
  } else if (operacao == "-") {
    soma = numero1 - numero2;
    dados = "subtraçao";
    print(soma);
  } else if (operacao == "*") {
    soma = numero1 * numero2;
    dados = "mutiplicaçao";
    print(soma);
  } else if (operacao == "/") {
    soma = numero1 / numero2;
    dados = "divisao";
    print(soma);
  } else {
    print("operaçao invalida");
    exit(0);
  }

  print("O resultado da $dados entre: $numero1 e $numero2 = $soma");
}
