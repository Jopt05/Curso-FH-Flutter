import 'package:flutter/material.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Ocupa por lo menos dos hijos
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.home_max ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.label_outline ),
          label: 'Categorías'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite_outline ),
          label: 'Favoritos'
        ),
      ],
    );
  }
}