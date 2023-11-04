import 'package:bmi_app/blocs/bmi_calculator_bloc.dart';
import 'package:bmi_app/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<BMICalculatorBloc>(
        create: (context) => BMICalculatorBloc(),
        child: BMICalculatorScreen(),
      ),
    );
  }
}