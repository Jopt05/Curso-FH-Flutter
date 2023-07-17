import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twelve_cinemapedia/presentation/screens/screens.dart';
import 'package:twelve_cinemapedia/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    
    ShellRoute(
      // Algo que se llama en tiempo de ejecución para construir algo
      builder: (context, state, child) {
        return HomeScreen(
          childView: child,
        );
      },
      // Configuraciones normales de router 
      routes: [

        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: "movie/:id",
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id';

                return MovieScreen(
                  movieId: movieId,
                );
              }
            ),
          ]
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesView();
          },
        ),

      ]
    ),
    
    // Rutas padre hijo
    // GoRoute(
    //   path: "/",
    //   name: HomeScreen.name,
    //   builder: (context, state) => const HomeScreen(
    //     childView: HomeView(),
    //   ),
    //   // Rutas hijas
    //   routes: [
    //     GoRoute(
    //       // No hace falta el primer slash, ya que lo proporciona el padre
    //       path: "movie/:id",
    //       name: MovieScreen.name,
    //       builder: (context, state) {
    //         // Obtener el ID
    //         final movieId = state.pathParameters['id'] ?? 'no-id';

    //         return MovieScreen(
    //           movieId: movieId,
    //         );
    //       }
    //     ),
    //   ]
    // ),
    
  ],
);