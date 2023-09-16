

import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  // print('Hello world: ${caculadora_imc.calculate()}!');
  print("Calculadora de IMC");


  try {
    // peso
    stdout.write("Informe o seu peso em quilogramas: ");
    var peso1 = stdin.readLineSync(encoding: utf8);
    var peso = double.parse(peso1 ?? "0");
    print(peso);

    // altura em metros
    stdout.write("Informa sua altura em metros [Ex 1.81]: ");
    var altura1 = stdin.readLineSync(encoding: utf8);
    var altura = double.parse(altura1 ?? "0");

    print(altura);

    // caculo do IMC
    // funcçao de calcular imc
    double calcularIMC(double peso, double altura) {
      return peso / (altura * altura);
    }

    double imc = calcularIMC(peso, altura);

    // funçao para classificar o o IMC
    String classificarIMC(double imc) {
      if (imc < 18.5) {
        return "Abaixo do peso";
      } else if (imc < 24.9) {
        return "Peso normal";
      } else if (imc < 29.9) {
        return "Sobrepeso";
      } else if (imc < 34.9) {
        return "Obesidade Grau 1";
      } else if (imc < 39.9) {
        return "Obesidade Grau 2";
      } else {
        return "Obesidade Grau 3";
      }
    }

    // exibir resultado
    print("O seu IMC e : ${imc.toStringAsFixed(2)}");
    print("Clasificaçao : ${classificarIMC(imc)}");
  } catch (e) {
    print("Verifique se voce digitou corretamente: $e");
  }
}
