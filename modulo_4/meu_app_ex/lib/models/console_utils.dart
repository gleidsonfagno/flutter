// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerStringTexto(String texto) {
    print(texto);
    return lerString();
  }

  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble() {
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? lerDoubleComTextoComSaida(String texto, String valorSaida) {
    do {
      try {
        var value = lerStringTexto(texto);
        if (value == valorSaida) {
          return null;
        }
        value = lerStringTexto(texto);
        return double.parse(value);
      } catch (e) {
        return null;
        print(texto);
      }
    } while (true);
  }

  static double? letDoubleComtexto(String texto) {
    print(texto);
    return lerDouble();
  }
}
