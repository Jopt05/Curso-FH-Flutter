import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}
// comentario

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {

    // Viene de Math
    final random = Random();

    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    borderRadius = random.nextInt(100) + 10;

    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          // duracion
          duration: const Duration( milliseconds: 400 ),
          // tipo de animacion
          curve: Curves.easeOutCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon( Icons.play_arrow_rounded ),
      ),
    );
  }
}