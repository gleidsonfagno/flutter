import 'package:hive/hive.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 0)
class IMCModel {
  @HiveField(0)
  late double weight;

  @HiveField(1)
  late double height;

  @HiveField(2)
  late double bmi;

  IMCModel(this.weight, this.height, this.bmi);
}
