import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user1),
          title: const Text("Usuario 1"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Olar! Tudo bem?"), Text("08:59")],
          ),
          // trailing: const Icon(Icons.menu),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              if (menu == "Opcao2") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "Opçao 1", child: Text("Opçao 1")),
                const PopupMenuItem<String>(
                  value: "Opçao 2",
                  child: Text("Opçao 2"),
                ),
                const PopupMenuItem<String>(
                  value: "Opçao 3",
                  child: Text("Opçao 3"),
                )
              ];
            },
          ),
          // isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
