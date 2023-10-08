import 'dart:io';

void main() {
  double valor = double.parse(stdin.readLineSync()!);

  if (valor > 0) {
    //TODO: Imprimir a mensagem de sucesso, formatando o saldo atual (vide Exemplos).
    print("Deposito realizado com sucesso!\n Saldo atual:  R\$ ${valor.toStringAsFixed(2)}");
  } else if (valor < 0) {
    //TODO: Imprimir a mensagem de valor inválido.
    print("Valor invalido! Digite um valor maior que zero.");
  } else {
    //TODO: Imprimir a mensagem de encerrar o programa.
    print("Encerrando o programa...");
  }
}
