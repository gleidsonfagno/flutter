import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image-assetis.dart';
import 'package:trilhaapp/pages/list_view.dart';
import 'package:trilhaapp/pages/list_view_horizontal.dart';
import 'package:trilhaapp/pages/tarefa_page/tarefa_hive_page.dart';
import 'package:trilhaapp/shared/widgets/custon_drawr.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  get currentIndex => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Main page"),
        ),
        drawer: const CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                // scrollDirection: Axis.vertical,
                children: const [
                  CardPage(),
                  ImageAssetisPage(),
                  ListViewPage(),
                  ListViewHorizontal(),
                  TarefaPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                  // print(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Home 1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Adiciona 2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Perfil 3", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: "Perfil 4", icon: Icon(Icons.image)),
                  BottomNavigationBarItem(
                      label: "Tarefas", icon: Icon(Icons.list)),
                  // BottomNavigationBarItem(
                  //     label: "", icon: Icon(null)), // Espaço reservado
                ]),
          ],
        ),
      ),
    );
  }
}
