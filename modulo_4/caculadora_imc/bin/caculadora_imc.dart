import 'dart:convert';
import 'dart:io';

import 'package:caculadora_imc/cacular_imc.dart';
import 'package:caculadora_imc/class_pessoa.dart';
import 'package:caculadora_imc/classificar_imc.dart';

void main(List<String> arguments) {
  // print('Hello world: ${caculadora_imc.calculate()}!');
  print("Calculadora de IMC");

  try {
    // nome
    stdout.write("Qual o seu nome: ");
    String? nome1 = stdin.readLineSync(encoding: utf8);
    String nome = (nome1 ?? " ");
    print(nome);
    if (nome == null || nome.isEmpty) {
    print("Digite um nome válido.");
  } else {
    String nome1 = nome;
    print("Nome digitado: $nome1");
  }
    // peso
    stdout.write("Informe o seu peso em quilogramas: ");
    var peso1 = stdin.readLineSync(encoding: utf8);
    var peso = double.parse(peso1 ?? "0");
    print(peso);

    // altura em metros
    stdout.write("Informa sua altura em metros [Ex 1.81]: ");
    var altura1 = stdin.readLineSync(encoding: utf8);
    var altura = double.parse(altura1 ?? "0");

    Pessoa(peso: peso, altura: altura, nome: nome);

    // caculo do IMC
    calcularIMC(peso, altura);

    double imc = calcularIMC(peso, altura);

    // funçao para classificar o o IMC
    classificarIMC(imc);

    var pesoas = Pessoa(peso: peso, altura: altura, nome: nome);

    // exibir resultado
    print("O seu IMC e : ${imc.toStringAsFixed(2)}");
    print("Clasificaçao: ${pesoas.nome}, voçe esta ${classificarIMC(imc)}");
  } catch (e) {
    print("Verifique se voce digitou corretamente: $e");
  }
}
