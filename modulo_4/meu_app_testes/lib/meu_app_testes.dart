// import 'dart:convert';
// // import 'dart:typed_data';

// import 'package:http/http.dart' as http;

double calcularDesconto(double valor, double desconto, bool percentual) {
  if (valor <= 0) {
    throw ArgumentError("o valor do produto nao pode ser menor que zero");
  }
  if (desconto <= 0) {
    throw ArgumentError("o valor do desconto nao pode ser menor que zero");
  }
  if (percentual) {
    return valor - ((valor * desconto) / 100);
  }
  return valor - desconto;
}

String converteTuUpper(String texto) {
  return texto.toUpperCase();
}

double returnaValor(double valor) {
  return valor;
}

