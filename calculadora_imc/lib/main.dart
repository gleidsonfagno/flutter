import 'package:flutter/material.dart';

void main() {
  runApp(const IMCCalculatorApp());
}

class IMC {
  double weight;
  double height;
  late double bmi;

  IMC(this.weight, this.height) {
    calculateBMI();
  }

  void calculateBMI() {
    bmi = weight / (height * height);
  }

  String calculateClassification() {
    if (bmi < 16) {
      return 'Magreza grave';
    } else if (bmi >= 16 && bmi < 17) {
      return 'Magreza moderada';
    } else if (bmi >= 17 && bmi < 18.5) {
      return 'Magreza leve';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Saudável';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Sobrepeso';
    } else if (bmi >= 30 && bmi < 35) {
      return 'Obesidade Grau 1';
    } else if (bmi >= 35 && bmi < 40) {
      return 'Obesidade Grau 2';
    } else {
      return 'Obesidade Grau 3';
    }
  }
}

class IMCCalculatorApp extends StatelessWidget {
  const IMCCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const IMCCalculatorScreen(),
    );
  }
}

class IMCCalculatorScreen extends StatefulWidget {
  const IMCCalculatorScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IMCCalculatorScreenState createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  final List<IMC> imcList = [];

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _calculateIMC() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      IMC imc = IMC(weight, height);
      setState(() {
        imcList.add(imc);
      });

      weightController.text = '';
      heightController.text = '';
    }
  }

  void _removeItem(int index) {
    setState(() {
      imcList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Peso (kg)'),
                ),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Altura (m)'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateIMC,
                  child: const Text('Calcular IMC'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: imcList.length,
              itemBuilder: (context, index) {
                final imc = imcList[index];
                final classification = imc.calculateClassification();
                return ListTile(
                  title: Text('IMC: ${imc.bmi.toStringAsFixed(2)}'),
                  subtitle: Text(
                    'Peso: ${imc.weight.toStringAsFixed(2)} kg, '
                    'Altura: ${imc.height.toStringAsFixed(2)} m',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(classification),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
