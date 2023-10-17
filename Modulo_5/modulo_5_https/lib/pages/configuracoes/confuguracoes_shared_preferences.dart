// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/Service/app_storage_services.dart';

class ConfiguracoesSharedPreferencesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferencesPage({super.key});

  @override
  State<ConfiguracoesSharedPreferencesPage> createState() => _ConfiguracoesSharedPreferencesPageState();
}

class _ConfiguracoesSharedPreferencesPageState extends State<ConfiguracoesSharedPreferencesPage> {
  AppStorageService storage = AppStorageService();
  TextEditingController nomeUsuarioControlle = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  // final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  // final CHAVE_ALTURA = "CHAVE_ALTURA";
  // final CAHVE_RECEBER_NOTIFICACAO = "CAHVE_RECEBERNOTIFICACAO";
  // final CHAVE_TEMA_ESCURO = "CHAVE_MODO_ESCURO";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    // storage = await SharedPreferences.getInstance();
    nomeUsuarioControlle.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text =
        (await (storage.getConfiguracoesAltura())).toString();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacao();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configuraçoes"),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Nome usuario",
                  ),
                  controller: nomeUsuarioControlle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Altura",
                  ),
                  controller: alturaController,
                ),
              ),
              SwitchListTile(
                title: const Text("Receber notificaçoes"),
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                },
                value: receberNotificacoes,
              ),
              SwitchListTile(
                  title: const Text("Tema escuro"),
                  value: temaEscuro,
                  onChanged: (bool value) {
                    setState(() {
                      temaEscuro = value;
                    });
                  }),
              const Divider(),
              TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setConfiguracoesAltura(
                        double.parse(alturaController.text));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Meu App"),
                            content:
                                const Text("Favor informar uma altura valida"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"))
                            ],
                          );
                        });
                    return;
                  }
                  await storage
                      .setConfiguracoesNomeUsuario(nomeUsuarioControlle.text);
                  await storage
                      .setConfiguracoesReceberNotificacao(receberNotificacoes);
                  await storage.setConfiguracoesTemaEscuro(temaEscuro);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(
                        16.0), // Ajuste o valor do padding conforme necessário
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text("Salvar"),
              )
              // child: const Text(
              //   "Salvar",
              //   style: TextStyle(
              //       height: 3,
              //       wordSpacing: 5,
              //       backgroundColor: Colors.amber),
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
