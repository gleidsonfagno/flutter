import 'package:meu_app_orientacao_obj/classes/pessoa_abstract.dart';
import 'package:meu_app_orientacao_obj/service/notificaocao_interface.dart';

class NotificaocaoEmail implements NotificaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("enviar EMAIL para: ${pessoa.getNome()}");

  }
}
