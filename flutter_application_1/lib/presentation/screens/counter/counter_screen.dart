import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  // Manda a llamar a la construcción del widget que ahora puede tener cambio de estado
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Counter Screen')
        ),
      ),
      body: Center(
        child: Column(
          // center, end, spacearound, spacebetween
          // Permite alinear
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100
              ),
            ),
            Text(
                clickCounter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(
                  fontSize: 25,
                )
              )
          ],
        ),
      ),
      // Botton de acciones
      floatingActionButton: FloatingActionButton(
        // Suma al oprimir el boton 
        onPressed: () {
          setState(() {
            clickCounter += 1;
          });
          // También se puede hacer así
          // setState((){});
        },
        // Icon también es un widget
        child: const Icon(
          // Icono de más para el botón
          Icons.plus_one
        ),
      ),
    );
  }
}
