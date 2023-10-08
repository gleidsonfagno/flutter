import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/services/gerador_numero_aleatorio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    debugPrint("chamando metodo bilde");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu App",
          style: GoogleFonts.aclonica(),
        ),
      ),
      body: Container(
        // color: const Color(0xFF079CFF),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          // Use Column para agrupar widgets no body
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // width: double.infinity,
              width: 200,
              height: 200,
              color: Colors.cyan,
              child: Text(
                "Acoes do uduario",
                style: GoogleFonts.acme(),
              ),
            ),
            SizedBox(
              child: Container(
                width: 100,
                height: 100,
                // width: double.infinity,
                color: Colors.orange,
                child: Text(
                  // child: Text(
                  "O numero gerado foi: $numeroGerado",
                  style: GoogleFonts.acme(fontSize: 20),
                  // ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.indigo,
              child: Text(
                // child: Text(
                "foi clicado $quantidadeCliques vezes",
                style: GoogleFonts.acme(fontSize: 20),
                // ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          // child: Text(
                          "Nome:",
                          style: GoogleFonts.acme(fontSize: 20),
                          // ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        child: Text(
                          // child: Text(
                          "Fagno pinheiro:",
                          style: GoogleFonts.acme(fontSize: 20),
                          // ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          // child: Text(
                          "grid Row",
                          style: GoogleFonts.acme(fontSize: 20),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            quantidadeCliques = quantidadeCliques + 1; // Corrigido o incremento
            numeroGerado =
                GeradorNumeroAleatorioServices.geraNumeroAleatorio(1000);
          });
        },
      ),
    );
  }
}
