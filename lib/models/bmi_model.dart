// bmi_model.dart
class BMIModel {
  double weight;
  double height;
  double bmi;
  String result;

  BMIModel({required this.weight, required this.height, this.bmi = 0.0, this.result = ""});

  String calculateResult() {
    if (bmi < 18.5) {
      return "UnderWeight";
    } else if (18.5 <= bmi && bmi < 25) {
      return "Normal";
    } else if (25 <= bmi && bmi < 30) {
      return "Over Weight";
    }
    return "Obese";
  }
}