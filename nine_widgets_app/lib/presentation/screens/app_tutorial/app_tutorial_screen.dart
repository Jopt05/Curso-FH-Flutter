import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final Color color;

  SlideInfo(
    this.title,
    this.caption,
    this.color
  );
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'caption', Colors.red),
  SlideInfo('Entrega la comida', 'caption', Colors.blue),
  SlideInfo('Disfruta la comida', 'caption', Colors.yellow),
];


class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() { 

      final page = pageViewController.page ?? 0;

      if ( !endReached && page >= ( slides.length - 1 ) ) {
        setState(() {
          endReached = true;
        });
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,            
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                color: slideData.color
            )).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Comenzar'),
            ),
          ): const SizedBox(),
        ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String title;
  final String caption;
  final Color color;

  const _Slide({super.key, required this.title, required this.caption, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: color,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(title),
            const SizedBox(
              height: 30,
            ),
            Text(caption)
          ],
        ),
      ),
    );
  }
}