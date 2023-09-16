//classes
import 'package:meu_app_orientacao_obj/enum/tipo_notificacao.dart';

abstract class Pessoa {
  String _nome = "";
  String _endereco = "";
  String _email = "";
  String _celular = "";
  String _token = "";
  TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;

// nome
  void setNome(String nome) {
    _nome = nome.toUpperCase();
  }

  String getNome() {
    return _nome;
  }

// endereco
  String getEndereco() {
    return _endereco;
  }

  void setendereco(String endereco) {
    _endereco = endereco;
  }

// notificaçao
  void setTipoNotificacao(TipoNotificacao tipoNotificacao) {
    _tipoNotificacao = tipoNotificacao;
  }

  TipoNotificacao getTipoNotificacao() {
    return _tipoNotificacao;
  }

// email
  void setEmail(String email) {
    _email = email.toUpperCase();
  }

  String getEmail() {
    return _email;
  }
// celular
void setCelular(String celular) {
    _celular = celular.toUpperCase();
  }

  String getCelular() {
    return _celular;
  }
  // token
  void setToken(String token) {
    _token = token.toUpperCase();
  }

  String getToken() {
    return _token;
  }
  // constructor
  Pessoa(String nome, String endereco,
      {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM}) {
    _nome = nome;
    _endereco = endereco;
    _tipoNotificacao;
  }
  //overhard
  @override
  String toString() {
    return {
      "Nome": _nome,
      "Endereco": _endereco,
      "TipoNotificacao": _tipoNotificacao
    }.toString();
  }
}
