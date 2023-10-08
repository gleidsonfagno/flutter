import 'dart:io';
import 'dart:math';

void main() {
  var valorInicial = double.parse(stdin.readLineSync()!);
  var taxaJuros = double.parse(stdin.readLineSync()!);
  var periodo = int.parse(stdin.readLineSync()!);


 
   //TODO: Iterar, baseado no período em anos, para calculo do valorFinal com os juros.
  var valorFinal = valorInicial * pow(1 + taxaJuros, periodo);

  print("Valor final do investimento: R\$ ${valorFinal.toStringAsFixed(2)}");
}
