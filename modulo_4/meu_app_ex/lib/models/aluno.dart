class Aluno {
  String _nome = "";
  final List<double> _notas = [];

  Aluno(this._nome);

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void adicionarNotas(double nota) {
    _notas.add(nota);
  }

  Object? getNotas() {
    return _notas;
  }

  double retornaMedia() {
    // var tatalNotas = 0.0;
    var media = _notas.reduce((value, element) => value + element) / _notas.length;
    // for (var nota in _notas) {
    //   tatalNotas = tatalNotas + nota;
    // }
    // var media = tatalNotas / _notas.length;
    return media.isNaN ? 0 : media;
  }

  bool aprovado(double notaCorte) {
    return retornaMedia() >= notaCorte;
  }
}
