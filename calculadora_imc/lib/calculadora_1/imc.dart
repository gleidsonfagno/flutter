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
}
