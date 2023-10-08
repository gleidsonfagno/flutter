import 'package:flutter/material.dart';
import 'package:trilhaapp/services/gerador_numero_aleatorio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var numeroGerado = 0;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    debugPrint("chamando metodo bilde");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu App"),
      ),
      body: Center(child: Text(numeroGerado.toString())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            numeroGerado = GeradorNumeroAleatorioServices.geraNumeroAleatorio(1000);
            // debugPrint(numeroGerado.toString());
          });
        },
      ),
    );
  }
}
