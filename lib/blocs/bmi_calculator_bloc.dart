
// bmi_calculator_bloc.dart
import 'package:bmi_app/models/bmi_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICalculatorBloc extends Bloc<BMIEvent, BMIModel> {
  BMICalculatorBloc() : super(BMIModel(weight: 0, height: 0, bmi: 0.0));

  @override
  Stream<BMIModel> mapEventToState(BMIEvent event) async* {
    if (event is CalculateBMI) {
      double bmi = event.weight / (event.height * event.height);
      yield state..bmi = bmi;
    }
  }
}

abstract class BMIEvent {}

class CalculateBMI extends BMIEvent {
  final double weight;
  final double height;

  CalculateBMI({required this.weight, required this.height});
}
