//classes
import 'package:meu_app_orientacao_obj/classes/pessoa_abstract.dart';
import 'package:meu_app_orientacao_obj/enum/tipo_notificacao.dart';

class PessoaFisica extends Pessoa {
  // String _nome = "";
  // String _endereco = "";
  String _cpf = "";

  // void setNome(String nome) {
  //   _nome = nome.toUpperCase();
  // }

  // String getNome() {
  //   return _nome;
  // }

  // String getEndereco() {
  //   return _endereco;
  // }

  // void setendereco(String endereco) {
  //   _endereco = endereco;
  // }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  // constructor
  PessoaFisica(String nome, String endereco, String cpf, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao : tipoNotificacao) {
    // _nome = nome;
    // _endereco = endereco;
    _cpf = cpf;
  }

  //overhard
  @override
  String toString() {
    return {
      "Tipo": "pessoa fisica",
      "Nome": super.getNome(),
      "Endereco": getEndereco(),
      "CPF": _cpf,
      "TipoNotificacao": getTipoNotificacao()
    }.toString();
  }
}
