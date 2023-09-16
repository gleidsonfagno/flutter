import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {

  // lendo dados no console
  print("Digite algo: ");
  // Lê a linha de entrada do usuário
  var input = stdin.readLineSync(encoding: utf8);

  print("Você digitou: $input");

  var palavra = int.parse(input ?? "0");
  // se o valor for nulo
  var palavra2 = int.parse(input ?? "0");
  print(palavra);
  print(palavra2);

  // calculo de nota

  print("informe sua primeira nota: ");
  var dados = stdin.readLineSync(encoding: utf8);
  var prova1 = int.parse(dados ?? "0");
  print(dados);
  print("informe sua segundo nota: ");
  var dados1 = stdin.readLineSync(encoding: utf8);
  var prova2 = int.parse(dados1 == null ? "0" : dados1);
  print(prova2);

  print("sua media");
  var total = (prova1 + prova2) / 2;
  print(total);

  if (total >= 7) {
    print("o aluno passou com a nota: $total");
  } else if (total >= 5) {
    print("o aluno esta de recuperaçao nota: $total");
  } else {
    print("o aluno reprovou com nota: $total");
  }

  // estrutur de repeticao for
  for (var i = 0; i < 10; i++) {
    
    print(i);
    // Código a ser repetido em cada iteração
  }
}
