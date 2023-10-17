import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViaCEPModel {
  String? cep;
  String? logradouro;
  String? bairro;
  String? cidade;
  String? estado;

  ViaCEPModel({
    this.cep,
    this.logradouro,
    this.bairro,
    this.cidade,
    this.estado,
  });

  factory ViaCEPModel.fromJson(Map<String, dynamic> json) {
    return ViaCEPModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      cidade: json['localidade'],
      estado: json['uf'],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CEPApp(),
    );
  }
}

class CEPApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CEPAppState createState() => _CEPAppState();
}

class _CEPAppState extends State<CEPApp> {
  List<ViaCEPModel> ceps = [];
  ViaCEPModel? _currentCEP;

  TextEditingController cepController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController estadoController = TextEditingController();

  Future<void> _consultarCEP(String cep) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _currentCEP = ViaCEPModel.fromJson(data);
        cepController.text = _currentCEP!.cep ?? '';
        logradouroController.text = _currentCEP!.logradouro ?? '';
        bairroController.text = _currentCEP!.bairro ?? '';
        cidadeController.text = _currentCEP!.cidade ?? '';
        estadoController.text = _currentCEP!.estado ?? '';
      });
    } else {
      setState(() {
        _currentCEP = null;
        _limparCampos();
      });
    }
  }

  void _limparCampos() {
    cepController.clear();
    logradouroController.clear();
    bairroController.clear();
    cidadeController.clear();
    estadoController.clear();
  }

  void _cadastrarCEP() {
    final newCep = ViaCEPModel(
      cep: cepController.text,
      logradouro: logradouroController.text,
      bairro: bairroController.text,
      cidade: cidadeController.text,
      estado: estadoController.text,
    );

    setState(() {
      ceps.add(newCep);
    });

    _limparCampos();
  }

  void _editarCEP() {
    if (_currentCEP != null) {
      final editedCep = ViaCEPModel(
        cep: cepController.text,
        logradouro: logradouroController.text,
        bairro: bairroController.text,
        cidade: cidadeController.text,
        estado: estadoController.text,
      );

      final index = ceps.indexWhere((cep) => cep.cep == _currentCEP!.cep);

      if (index != -1) {
        setState(() {
          ceps[index] = editedCep;
        });
      }
    }
  }

  void _excluirCEP() {
    if (_currentCEP != null) {
      setState(() {
        ceps.removeWhere((cep) => cep.cep == _currentCEP!.cep);
      });

      _limparCampos();
      _currentCEP = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro e Consulta de CEPs'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cepController,
              decoration: const InputDecoration(labelText: 'CEP'),
            ),
          ),
          if (_currentCEP != null)
            Column(
              children: <Widget>[
                Text('CEP: ${_currentCEP!.cep}'),
                Text('Logradouro: ${_currentCEP!.logradouro}'),
                Text('Bairro: ${_currentCEP!.bairro}'),
                Text('Cidade: ${_currentCEP!.cidade}'),
                Text('Estado: ${_currentCEP!.estado}'),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: logradouroController,
              decoration: const InputDecoration(labelText: 'Logradouro'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: bairroController,
              decoration: const InputDecoration(labelText: 'Bairro'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cidadeController,
              decoration: const InputDecoration(labelText: 'Cidade'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: estadoController,
              decoration: const InputDecoration(labelText: 'Estado'),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _consultarCEP(cepController.text);
                },
                child: const Text('Consultar CEP'),
              ),
              ElevatedButton(
                onPressed: () {
                  _cadastrarCEP();
                },
                child: const Text('Cadastrar CEP'),
              ),
              ElevatedButton(
                onPressed: () {
                  _editarCEP();
                },
                child: const Text('Editar CEP'),
              ),
              ElevatedButton(
                onPressed: () {
                  _excluirCEP();
                },
                child: const Text('Excluir CEP'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ceps.length,
              itemBuilder: (context, index) {
                final cep = ceps[index];
                return ListTile(
                  title: Text(cep.cep ?? ''),
                  subtitle: Text(
                      'Logradouro: ${cep.logradouro ?? ''}, Bairro: ${cep.bairro ?? ''}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
