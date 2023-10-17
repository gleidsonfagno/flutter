import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';
// import 'package:trilhaapp/model/tarefa_hive_model.dart';
// import 'model/dados_cadastrais_model.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// Future iniciarBancoDedados() async {
//   vad db =
//   await openDatabase(
//     path.join(await getDatabasesPath() "database.db"),
//     version: 1,
//     onCreate: (Database db, int version){
//       for(var i = 1; i< script.length; i ++){
//         await
//       }
//     }
//   )
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await dotenv.load(fileName: ".env");
//   var documentsDirectory =
//       await path_provider.getApplicationDocumentsDirectory();
//   Hive.init(documentsDirectory.path);

//   Hive.registerAdapter(DadosCadastraisModelAdapter());
//   Hive.registerAdapter(TarefaHiveModelAdapter());
//   runApp(const MyApp());
// }
