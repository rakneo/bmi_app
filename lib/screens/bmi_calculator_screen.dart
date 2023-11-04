import 'package:bmi_app/blocs/bmi_calculator_bloc.dart';
import 'package:bmi_app/models/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICalculatorScreen extends StatelessWidget {

  const BMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BMICalculatorBloc>();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: weightController,

              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Weight (kg)"
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Height (m)"
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double weight = double.tryParse(weightController.text) ?? 0;
                double height = double.tryParse(heightController.text) ?? 0;
                bloc.add(CalculateBMI(weight: weight, height: height));
              },
              child: const Text("Calculate BMI"),
            ),
            const SizedBox(height: 20),
            BlocBuilder<BMICalculatorBloc, BMIModel>(
              builder: (context, state) {
                if (state.bmi == 0.0) {
                  return const Text("BMI: ");
                } else {
                  return Text("BMI: ${state.bmi.toStringAsFixed(2)}\nResult: ${state.calculateResult()}");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
