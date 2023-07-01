import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {

  const CounterFunctionsScreen({super.key});

  @override
  // Manda a llamar a la construcción del widget que ahora puede tener cambio de estado
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Counter Functions')
        ),
        // leading: IconButton(
        //   // Icon es un widget para mostrar iconos, hay para mostrar imágenes también
        //   icon: const Icon( Icons.refresh_rounded ), 
        //   onPressed: () {  },
        // ),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.plus_one_outlined,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            }
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {
                clickCounter--;
              });
            }
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  
  final VoidCallback? onPressed;

  const CustomButton({
    super.key, 
    required this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        icon
      ),
    );
  }
}
