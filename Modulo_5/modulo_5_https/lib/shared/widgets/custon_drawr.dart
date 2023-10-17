import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configuracoes/configura%C3%A7oes_hive_page.dart';
import 'package:trilhaapp/pages/dados_caos_cadastrais/dados_cadastrais_hive.dart';
// import 'package:trilhaapp/pages/configuracoes/confuguracoes_page.dart';
// import 'package:trilhaapp/pages/dados_caos_cadastrais/dados_cadastrais_hive.dart';
import 'package:trilhaapp/pages/login_pages.dart';
import 'package:trilhaapp/pages/numero_aleatorios/numeros_aleatorios_hive_page.dart';
import 'package:trilhaapp/pages/posts_page.dart';
// import 'package:trilhaapp/pages/numero_aleatorios/numeros_aleatorios_shared_preferences.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.photo_camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.photo_library),
                        ),
                        // Row(
                        //   children: [
                        //     Text("Camera"),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Text("Camera"),
                        //   ],
                        // ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png"),
                ),
                accountName: const Text("Danilo perez"),
                accountEmail: const Text("email.@gmail.com")),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Dados cadastris"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DadosCadastraisHivePage(
                        // texto: "Meus dados ",
                        // dados: ["nome", "Endereço"],
                        ),
                  ));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 15),
                      child: const Column(
                        children: [
                          Text(
                            "1 - Uso da Aplicação: Você concorda em utilizar nossa aplicação apenas para fins legais e de acordo com todas as leis e regulamentos aplicáveis.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            " 2 - Conta de Usuário: Se nossa aplicação requerer o registro de uma conta de usuário, você será responsável por manter a confidencialidade de suas informações de login e senha.Conteúdo do Usuário: Qualquer conteúdo que você enviar ou compartilhar através da",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Gerador de numeros"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const NumerosAleatoriosHivePage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configuraçoes Hive"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const ConfiguracoesHivePage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.post_add),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Posts"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => const PostsPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text(
                        "Meu app",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text("Voce saira do aplicativo"),
                          Text("Deseja realmente sair do aplicativo"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Nao")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginPages()));
                            },
                            child: const Text("Sim")),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
