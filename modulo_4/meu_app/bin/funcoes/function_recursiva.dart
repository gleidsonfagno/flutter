// fatorial ele chama ela mesma
// import '../funcoes/util.dart' as util;

void main(List<String> argument) {
  var fatorialCaculado = fatorial(10);
  print(fatorialCaculado);
}

int fatorial(int numero) {
  if (numero == 1) {
    return 1;
  }
  return numero * fatorial(numero - 1);
}
