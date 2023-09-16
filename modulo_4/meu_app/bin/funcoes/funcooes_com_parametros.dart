void main(List<String> arguments) {
  print(executar(10, incrementar));
  print(executar(10, decrementart));
}

int executar(int numero, Function func) {
  return func(numero);
}

int incrementar(int numero) {
  return numero + 1;
}

int decrementart(int numero) {
  return numero - 1;
}
