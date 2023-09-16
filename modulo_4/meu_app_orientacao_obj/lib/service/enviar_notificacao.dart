import 'package:meu_app_orientacao_obj/classes/pessoa_abstract.dart';
import 'package:meu_app_orientacao_obj/enum/tipo_notificacao.dart';
import 'package:meu_app_orientacao_obj/service/implementacao/notificacao_emaiil.dart';
import 'package:meu_app_orientacao_obj/service/implementacao/notificao_sms.dart';
import 'package:meu_app_orientacao_obj/service/implementacao/notificaocao_push.dart';
import 'package:meu_app_orientacao_obj/service/notificaocao_interface.dart';

class EnviarNotificacao {
  NotificaoInterface? noticacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL:
        noticacao = NotificaocaoEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        noticacao = NotificaocaoPush();
        break;
      case TipoNotificacao.sms:
        noticacao = NotificaocaoSMS();
        break;
      default:
        // return;
        break;
    }
    if (noticacao != null) {
      noticacao!.enviarNotificacao(pessoa);
    } else {
      print("pessoa sem ttipo de notificaoçao");
    }
  }
}
