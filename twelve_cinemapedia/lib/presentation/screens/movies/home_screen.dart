

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/initial_loader_provider.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:twelve_cinemapedia/presentation/screens/screens.dart';
import 'package:twelve_cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:twelve_cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
  final Widget childView;

  const HomeScreen({
    super.key,
    required this.childView
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: CustomBottonNavigation(
        
      ),
    );
  }
}