import 'dart:convert';
import 'dart:ffi';

import 'package:meu_app/meu_app.dart' as meu_app;
import 'package:test/test.dart';

void main(List<String> arguments) {
  // print('Hello world - ${meu_app.calculate()}!');
  String texto = "DIO";
  var text2 = "DIO";
  String text3;
  text3 = "ola";

  int numero_1;
  numero_1 = 1;
  var numer_2 = 2;
  int numero_3;
  numero_3 = 1;
  List<String> lista = [];
  lista.add("value");
  var lista1 = [];
  lista1.add("value");
  lista1.add(1);
  lista1.add(1.2);

  int numero = 10;
  var numero01 = 11;

  print("retorne verdadeiro somente se esse inteiro for par");
  print(numero.isEven);
  print(numero01.isEven);

  print("retornar se o numero for impar");
  print(numero.isOdd);
  print(numero01.isOdd);

  print("retorna se o numero e infinito");
  print(double.infinity);

  print("retorna numero e negativo");
  print(numero.isNegative);
  print((numero01 * -1).isNegative);

  print("converter string para inteiro");
  print(int.parse("10"));
  // print(int.parse("source"));
  print(int.tryParse("teste"));

  double temperatura = 25.5;
  double preco = 19.99;
  double altura = 1.75;

  print("Temperatura: $temperatura graus Celsius");
  print("Preço: R\$$preco");
  print("Altura: $altura metros");

  print("remover ponto flutuante");
  print(altura.truncate());

  print("converte para inteiro.");
  print(preco.toInt());

  print("arredondamento para cima");
  print(altura.ceil());
  print(preco.ceil());

  print("arredonda para baixo");
  print(preco.floor());
  print(altura.floor());

  print("retorna se o numero e finito");
  print(altura.isFinite);

  print("retorna se o numero e infinito");
  print(preco.isInfinite);

  print("retona se o numero nao e valido");
  print(preco.isNaN);

  print("retorna se o numero e negativo");
  print(altura.isNegative);
  print((preco * -1).isNegative);

  print("converte string para doble/floate");
  print(double.parse("10"));
  // print(double.parse("altura"));
  print(double.tryParse("peso"));

  String vazia = "";
  print(vazia.isEmpty); // Saída: true

  String naoVazia = "Texto não vazio";
  print(naoVazia.isNotEmpty); // Saída: true

  // maiscula /menusula
  print(naoVazia.toLowerCase());
  print(naoVazia.toUpperCase());

  // contains: Verifica se a string contém um determinado substring.
  String mensagem = "Bom dia, como você está?";
  print(mensagem.contains("como")); // Saída: true
  print(mensagem.contains("noite")); // Saída: false

  // substring: Retorna uma substring da string original, delimitada por índices.

  String frase = "Olá, mundo!";
  String sub = frase.substring(5, 10);
  print(sub); // Saída: mundo

  // indexOf e lastIndexOf: Retorna a posição da primeira ou última ocorrência de um substring.
  String palavra = "O mundo é um lugar incrível e o mundo é grande.";
  print(palavra.indexOf("mundo")); // Saída: 2
  print(palavra.indexOf("."));
  print(palavra.lastIndexOf("mundo")); // Saída: 31

  // replaceAll: Substitui todas as ocorrências de um substring por outro substring.
  String fraseBom = "Bom dia, como você está?";
  String novaFrase = fraseBom.replaceAll("Bom dia", "Boa noite");
  print(novaFrase); // Saída: Boa noite, como você está?

  // quebra uma string por um caracter especifico
  print(palavra.split(" ")); //vai tr virgula onde tem espaço

  // trim, trimLeft e trimRight: Remove espaços em branco no início, no fim ou em ambos os lados da string.
  String olamundo = "   Olá, mundo!   ";
  print(olamundo.trim()); // Saída: Olá, mundo!
  print(olamundo.trimLeft()); // Saída: Olá, mundo!
  print(olamundo.trimRight()); // Saída:    Olá, mundo!

  // boolen
  bool isSunny = true;
  bool hasPermission = false;
  print(isSunny);
  print(hasPermission);
  print(!isSunny);
  print(!hasPermission);

  // Declaração de Listas:
  // Você pode criar uma lista em Dart usando a sintaxe de colchetes ([]) e inserindo  os elementos separados por vírgula:

  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> names = ["Alice", "Bob", "Charlie"];
  print(numbers[0]); // Saída: 1
  print(names[2]); // Saída: Charlie

  // tamanho da lista
  print(names.length); // Saída: 3

  // adicionar item
  List<int> myList = [10, 20, 30];
  myList.add(40); // Adiciona um elemento no final
  myList.insert(1, 15); // Insere um elemento na posição 1

  myList.remove(20); // Remove o elemento 20
  myList.removeAt(0); // Remove o elemento na posição 0

  List<dynamic> dynamicList = [];

  dynamicList.add(42); // Adiciona um inteiro
  dynamicList.add("Hello"); // Adiciona uma string
  dynamicList.add(true); // Adiciona um valor booleano
  dynamicList.add(3.14); // Adiciona um número de ponto flutuante
  print(dynamicList);
  for (var item in dynamicList) {
    print("Item: $item");
  }

  // se a lista ta vazia
  print(dynamicList.isEmpty);

  // vervalor comtem na lista
  print(dynamicList.contains("3"));
  print(dynamicList.contains("Hello"));

  // funcao where
  print(myList);
  print(myList.where((x) => x > 15 && x < 99));
  print(myList.reversed);

  // map
  // ignore: unused_local_variable
  Map<String, dynamic> ages = {
    "Alice": 25,
    "Bob": 30,
    "Charlie": 22,
  };

  print(ages);

  // assesando valore pela chave
  print(ages["Alice"]); // Saída: 25
  print(ages["Bob"]); // Saída: 30
  print(ages["Charlie"]); // Saída: 22

  // adicionando
  ages.addAll({"tem": 10, "eleven": 11});

  print(ages);

  // comtem chave
  print(ages.containsKey("eleven"));
  print(ages.containsKey(10));

  ages.addAll({"nome": "gleidson"});
  ages.addAll({"idade": 23});
  ages["nacido"] = DateTime(2001, 7, 19);

  print(ages);

  // constantes
  const String variavel = "ola";
  print(variavel);

  const bool verdade = true;
  print(verdade);

  // dynamic
  dynamic dynamicVar = 42; // Número inteiro
  print(dynamicVar);
  dynamicVar = "Hello, Dart!"; // String
  print(dynamicVar);
  dynamicVar = true; // Booleano
  print(dynamicVar);
  dynamicVar = [1, 2, 3]; // Lista
  print(dynamicVar);
  dynamicVar = {"key": "value"}; // Mapa
  print(dynamicVar.length);

  // DetaTime
  DateTime now = DateTime.now(); // Data e hora atual
  DateTime specificDate =
      DateTime(2023, 8, 27); // Data específica (ano, mês, dia)
  print(now);

  int year = now.year;
  int month = now.month;
  int day = now.day;
  int hour = now.hour;
  int minute = now.minute;
  int second = now.second;
  // int millisecond = now.millisecond;
  print(year);
  print(month);
  print(day);
  print(hour);
  print(minute);
  print(second);

  // dia da semana
  print(now.weekday);

  // soma de datas
  var now1 = now.add(Duration(days: 1));
  print(now1);
  print(now.add(Duration(days: 1)));
  print(now);
  print(now.subtract(Duration(hours: 1)));

  // comparaçao
  var data = DateTime.parse("2023-10-31 00:00:00");
  if (now.isAfter(data)) {
    print("A data atual é após a data específica.");
  } else if (now.isBefore(data)) {
    print("A data atual é antes da data específica.");
  } else {
    print("As datas são iguais.");
  }

  print(now);
  print(now.isAfter(data));
  print(now.isBefore(data));
  print(now.compareTo(data));
}
