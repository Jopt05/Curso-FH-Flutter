import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/counter/counter_functions_screen.dart';
// 'package:flutter_application_1/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Key
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Nos permite eliminar la bandera de desarrollo
        debugShowCheckedModeBanner: false,
        // El tema cambia dependiendo del dispositivo
        // Prendemos material 3
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.red
        ),
        home: CounterFunctionsScreen()
      );
  }
}
