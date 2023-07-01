import 'package:go_router/go_router.dart';
import 'package:twelve_cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      // Rutas hijas
      routes: [
        GoRoute(
          // No hace falta el primer slash, ya que lo proporciona el padre
          path: "movie/:id",
          name: MovieScreen.name,
          builder: (context, state) {
            // Obtener el ID
            final movieId = state.pathParameters['id'] ?? 'no-id';

            return MovieScreen(
              movieId: movieId,
            );
          }
        ),
      ]
    ),
    
  ],
);