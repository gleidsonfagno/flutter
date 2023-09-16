void main(List<String> arguments) {
  printHelloWord();
  printName("fagno");
  print(returnNumber());
  var number = returnNumber();
  print(number);

  print("funcao com parametro");
  var resultado = soma(2, 2);
  print(resultado);
}

void printHelloWord() {
  print("funcao print--> hello word");
}

void printName(String name) {
  print("may name is $name");
}

int returnNumber() {
  return 23;
}

// parametros
int soma(int n1, int n2) {
  return n1 + n2 * 50;
}
