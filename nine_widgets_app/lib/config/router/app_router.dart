import 'package:go_router/go_router.dart';
import 'package:nine_widgets_app/presentation/screens/counter/counter_screen.dart';
import 'package:nine_widgets_app/presentation/screens/screens.dart';
import 'package:nine_widgets_app/presentation/screens/snackbar/snackbar_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  // initialLocation: '/',

  routes: [
    // La primera ruta en el arreglo, es la primer ruta mostrada 
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      name: SnackBarScreen.name,
      path: '/snackbar',
      builder: (context, state) => SnackBarScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animated',
      builder: (context, state) => AnimatedScreen(),
    ),
    GoRoute(
      name: UiControlsScreen.name,
      path: '/ui-controls',
      builder: (context, state) => UiControlsScreen(),
    ),
    GoRoute(
      name: AppTutorialScreen.name,
      path: '/tutorial',
      builder: (context, state) => AppTutorialScreen(),
    ),
    GoRoute(
      name: InfiniteScrollScreen.name,
      path: '/infinite',
      builder: (context, state) => InfiniteScrollScreen(),
    ),
    GoRoute(
      name: CounterScreen.name,
      path: '/counter',
      builder: (context, state) => CounterScreen(),
    ),
    GoRoute(
      name: ThemeChangerScreen.name,
      path: '/theme_changer',
      builder: (context, state) => ThemeChangerScreen(),
    ),
  ],
);