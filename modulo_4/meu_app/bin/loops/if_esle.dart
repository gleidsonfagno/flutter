void main(List<String> arguments) {
  // if, if else , else
  var nota1 = 10;
  var nota2 = 10;
  var media = (nota1 + nota2) / 2;
  print(media);

  print(media >= 7);
  print(nota1 == nota2);
  print(nota1 != nota2);
  print((nota1 >= 7) && (nota2 >= 7));

  if (media >= 7) {
    print('voce passou');
  } else if (media < 7) {
    print("voce reprovou");
  } else if (nota1 == nota2) {
    print("notass iguais");
  } else if (nota1 != nota2) {
    print("nota $nota1, e diferente de $nota2 ");
  } else if (nota1 >= 7 && nota2 >= 7) {
    print("voce tirou nos 7 em todas");
  } else if (nota1 == 10 || nota2 == 10) {
    print("notas 1: $nota1 ou  nota 2 sao igual a 10");
  }

  // if ternario
  int age = 20;
  // se idade mair ou igual 18 (?) maior  (:)  senao menor de idade;
  String status = age >= 18 ? "Maior de idade" : "Menor de idade";
  print(status);

  
}