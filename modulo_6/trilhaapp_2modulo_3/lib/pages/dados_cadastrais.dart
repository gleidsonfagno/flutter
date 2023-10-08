// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repositores.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  // final String texto;
  // final List<String> dados;
  // required this.texto, required this.dados
  const DadosCadastrais({
    super.key,
  });

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeControler = TextEditingController(text: "");
  var dataNacimentoControler = TextEditingController(text: "");
  DateTime? dataNacimento;
  var nivelRepository = NivelRepository();
  var linguagesRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;
  bool salvando = false;
  // Text returnText(String texto) {
  //   return Text(texto,
  //       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700));
  // }
  @override
  void initState() {
    niveis = nivelRepository.retonaNiveis();
    linguagens = linguagesRepository.retornaLinguagen();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var intens = <DropdownMenuItem<int>>[];
    for (var i = 0; i < quantidadeMaxima; i++) {
      intens.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ),
      );
    }
    return intens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Meus dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextLabel(
                    texto: "Nome",
                  ),
                  TextField(
                    controller: nomeControler,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  const TextLabel(texto: "Data de nacimento"),
                  TextField(
                    controller: dataNacimentoControler,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2001, 1, 1),
                        firstDate: DateTime(1900, 5, 20),
                        lastDate: DateTime(2023, 10, 23),
                      );
                      if (data != null) {
                        dataNacimentoControler.text = data.toString();
                        dataNacimento = data;
                      }
                    },
                  ),
                  const TextLabel(
                    texto: "Nivel de esperiencia",
                  ),
                  Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              dense: true,
                              title: Text(nivel.toString()),
                              selected: nivelSelecionado == nivel,
                              value: nivel.toString(),
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                // print(value);
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              }))
                          .toList()),
                  const TextLabel(texto: "Linguagens preferidas"),
                  Column(
                    children: linguagens
                        .map(
                          (linguagem) => CheckboxListTile(
                              dense: true,
                              title: Text(linguagem),
                              value: linguagensSelecionadas.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionadas.remove(linguagem);
                                  });
                                }
                              }),
                        )
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de esperiencia"),
                  DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(51),
                      onChanged: (value) {
                        // print(value);
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretençao Salarial. R\$ ${salarioEscolhido.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                        // print(value);
                      }),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeControler.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("O Nome deve ser prenchifo")));
                          return;
                        }
                        if (dataNacimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Data de nacimento invalida")));
                          return;
                        }
                        if (nivelSelecionado.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nivel deve ser selecioanado")));
                          return;
                        }
                        if (linguagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ser selecionado au menos uma LInguagem")));
                          return;
                        }
                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ter au menos 1 ano de experiencia em umas das linguagem")));
                          return;
                        }

                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretençao salarial deve ser maior que 0")));
                          return;
                        }

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          "Salvando dados",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )));
                        // print(nomeControler.text);
                        // print(dataNacimento.toString());
                        // print(tempoExperiencia);
                        // print(salarioEscolhido.round());
                        // print(linguagensSelecionadas);
                        // print(nivelSelecionado);
                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "Dados salvos com sucess0!",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            )));
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        "Salvar",
                        style: TextStyle(
                          color: Colors.blue,
                          // backgroundColor: Colors.blue,
                        ),
                      ))
                  // Center(
                  //   child: Text(widget.dados.length.toString()),
                  // ),
                ],
              ),
      ),
    );
  }
}
