

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

/*
  '5124': Movie(),
  '21312': Movie
*/

// Definición de provider 
final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String,Movie>>(
  (ref) {
    final getMovie = ref.watch( movieRepositoryProvider ).getMovieById;
    return MovieMapNotifier(
      getMovie: getMovie,
    );
  }
);

// Definición del callback
typedef GetMovieCallback = Future<Movie>Function( String movieId );

class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie
  }): super({});

  Future<void> loadMovie( String movieId ) async {
    if( state[movieId] != null ) return;
    print("Realizando petición HTTP");
    final movie = await getMovie(movieId);

    state = {
      ...state,
      movieId: movie
    };
  }

}