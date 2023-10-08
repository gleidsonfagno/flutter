// Saldo insuficiente. Saque nao realizado!

import 'dart:io';

void main() {
  // Entrada de dados
  int saldoTotal = int.parse(stdin.readLineSync()!);
  int valorSaque = int.parse(stdin.readLineSync()!);

//  TODO: Criar as condições necessárias para impressão da saída, vide tabela de exemplos.

  if (valorSaque > saldoTotal) {
    print("Saldo insuficiente. Saque nao realizado!");
  } else {
    saldoTotal = saldoTotal - valorSaque;
    print("Saque realizado com sucesso! Novo saldo: ${saldoTotal}");
  }
}
