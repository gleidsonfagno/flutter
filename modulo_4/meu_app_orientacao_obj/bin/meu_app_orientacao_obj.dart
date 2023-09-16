// import 'package:meu_app_orientacao_obj/classes/pessoa.dart';
import 'package:meu_app_orientacao_obj/classes/pessoa_fisica.dart';
import 'package:meu_app_orientacao_obj/classes/pessoa_juridica.dart';
import 'package:meu_app_orientacao_obj/enum/tipo_notificacao.dart';
import 'package:meu_app_orientacao_obj/service/enviar_notificacao.dart';

void main(List<String> arguments) {
  // var pessoa = Pessoa("fagno", "Ubiratan");

  // pessoa.setNome("Danilo");

  // pessoa.setendereco("Rua 5");

  // print("${pessoa.getNome()} ${pessoa.getEndereco()}");
  // print(pessoa);

  // pessoa fisica
  var pessoafisica1 = PessoaFisica(
    "gleison",
    "rua 5",
    "000-000-000-00",
    tipoNotificacao: TipoNotificacao.PUSH_NOTIFICATION
  );
  print(pessoafisica1);

  // pessoa juridica

  var pessoaJurica = PessoaJuridica("empresa 1", "bairo c3", "093832123456789010",
      tipoNotificacao: TipoNotificacao.sms);
  print(pessoaJurica);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(pessoafisica1);
  enviarNotificacao.notificar(pessoaJurica);
}
