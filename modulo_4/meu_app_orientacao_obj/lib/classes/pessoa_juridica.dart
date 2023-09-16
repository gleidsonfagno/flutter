//classes
import 'package:meu_app_orientacao_obj/classes/pessoa_abstract.dart';
import 'package:meu_app_orientacao_obj/enum/tipo_notificacao.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = "";

  void setCpf(String cnpj) {
    _cnpj = cnpj;
  }

  String getCnpj() {
    return _cnpj;
  }

  // constructor
  PessoaJuridica(String nome, String endereco, String cnpj, {TipoNotificacao tipoNotificacao = TipoNotificacao.sms})
      : super(nome, endereco, tipoNotificacao : tipoNotificacao) {
    // _nome = nome;
    // _endereco = endereco;
    _cnpj = cnpj;
  }

  //overhard
  @override
  String toString() {
    return {
      "Tipo": "pessoa juridica",
      "Nome": getNome(),
      "Endereco": super.getEndereco(),
      "CNPJ": _cnpj,
      "TipoNotificacao": getTipoNotificacao()
    }.toString();
  }
}
