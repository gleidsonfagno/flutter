import 'dart:convert';
import 'dart:io';
// ignore: unused_import
import '../funcoes/util.dart' as util;

void main(List<String> arguments){
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
}