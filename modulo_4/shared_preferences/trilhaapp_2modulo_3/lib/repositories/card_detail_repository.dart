import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
  await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
      1,
      "meu Card",
      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
      "Este é o Meu Card, um espaço personalizado onde você pode adicionar e exibir informações importantes ou conteúdo relevante. Use-o para destacar mensagens importantes, mostrar imagens impressionantes ou compartilhar detalhes sobre seu aplicativo. O Meu Card é altamente personalizável e pode ser adaptado às suas necessidades");
  }
}
