import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {

  final List<Color> colors;
  final List<double> stops;

  const VideoBackground({
    this.colors = const[
      Colors.transparent,
      Colors.black
    ],
    this.stops = const[0.0,1.0]
  }): assert( colors.length == stops.length, 'Stops and colors must be same lenght' );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            // Donde quiero que se detenga  en la pantalla
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      )
    );
  }
}