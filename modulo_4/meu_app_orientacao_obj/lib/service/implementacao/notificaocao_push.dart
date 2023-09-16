import 'package:meu_app_orientacao_obj/classes/pessoa_abstract.dart';
import 'package:meu_app_orientacao_obj/service/notificaocao_interface.dart';

class NotificaocaoPush implements NotificaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("enviar Push para: ${pessoa.getNome()}");

  }
}
