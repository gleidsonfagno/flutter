import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox<Contact>('contacts');
  runApp(const MyApp());
}

class Contact {
  final String name;
  final String photoPath;

  Contact({required this.name, required this.photoPath});
}

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 0;

  @override
  Contact read(BinaryReader reader) {
    return Contact(
      name: reader.read(),
      photoPath: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer.write(obj.name);
    writer.write(obj.photoPath);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Contatos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>('contacts').listenable(),
        builder: (context, box, _) {
          contacts = box.values.toList();
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(File(contacts[index].photoPath)),
                ),
                title: Text(contacts[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteContact(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddContactScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deleteContact(int index) {
    final contactsBox = Hive.box<Contact>('contacts');
    contactsBox.deleteAt(index);
  }
}

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController nameController = TextEditingController();
  File? _imageFile;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 200,
      maxHeight: 100,
    );

    if (imageFile != null) {
      setState(() {
        _imageFile = File(imageFile.path);
      });
    }
  }

  Future<void> _saveContact() async {
    final name = nameController.text;
    if (name.isEmpty || _imageFile == null) {
      return;
    }

    final appDir = await getApplicationDocumentsDirectory();
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final savedImage = await _imageFile!.copy('${appDir.path}/$fileName');

    final newContact = Contact(name: name, photoPath: savedImage.path);
    final contactsBox = Hive.box<Contact>('contacts');
    contactsBox.add(newContact);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Adicionar Contato'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 20),
            _imageFile == null
                ? const Text('Nenhuma imagem selecionada.')
                : Image.file(_imageFile!),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _takePicture,
                  child: const Text('Tirar Foto'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _saveContact,
                  child: const Text('Salvar Contato'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
