// import 'dart:convert';
// import 'dart:io';

// import 'dart:js_util';

import 'dart:io';
// import 'dart:math';

import 'package:meu_app_ex/exception.dart/nome_invalido_exception.dart';
import 'package:meu_app_ex/models/aluno.dart';
import 'package:meu_app_ex/models/console_utils.dart';

void execute() {
  print("------executando progama-----");
  print("Bem vindo au sistema de notas");
  String nome = ConsoleUtils.lerStringTexto("Digite o nome do aluno");
  var aluno = Aluno(nome);
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    nome = "nome padrao";
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  // print(aluno);
  double? nota;
  do {
    nota = ConsoleUtils.letDoubleComtexto("digite a nota ou S para sair");
    if (nota != null) {
      aluno.adicionarNotas(nota);
    }
  } while (nota != null);
  var notasAluno = aluno.getNotas();
  var nomeALuno = aluno.getNome();
  print("oluno $nomeALuno: suas notas $notasAluno");
  print("A media do Aluno $nomeALuno foi: ${aluno.retornaMedia()}");

  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} Aprovado");
  } else {
    print("O aluno ${aluno.getNome()} Reprovado");
  }
}
// print("Sitema de Notas");
  // var line = stdin.readLineSync(encoding: utf8);
  // try {
  //   double numero = double.parse(line ?? "");
  //   print("voce digitou: $numero");
  // } catch (e) {
  //   print("numero invalidoo: $line");
  // } finally {
  //   print("Executando finally");
  // }
  // print("voce digitou: $numero");