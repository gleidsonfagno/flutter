import 'package:flutter/material.dart';

class DadosCadastrais extends StatefulWidget {
  final String texto;
  final List<String> dados;
  const DadosCadastrais({super.key, required this.texto, required this.dados});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.texto),
      ),
      body: Center(
        child: Text(widget.dados.length.toString()),
      ),
    );
  }
}
