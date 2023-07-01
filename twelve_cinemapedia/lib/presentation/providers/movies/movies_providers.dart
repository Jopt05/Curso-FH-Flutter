
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

// Cuando necesite saber las películas ahora en el cine, puedo consultar éste provider
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {

    final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;

    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies
    );

  }
);

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getPopular;
    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies
    );
  }
);

final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getUpcoming;
    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies
    );
  }
);

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getTopRated;
    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies
    );
  }
);

// Define que el moviesnotifier para cargar más películas necesita esa función
typedef MovieCallBack = Future<List<Movie>> Function({ int page });

class MoviesNotifier extends StateNotifier<List<Movie>> {
  // Permite controlar el StateNotifierProvider, ya que notifica su cambio
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]);

  Future<void> loadNextPage() async {
    if( isLoading ) return;

    isLoading = true;

    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];

    isLoading = false;
  }

}