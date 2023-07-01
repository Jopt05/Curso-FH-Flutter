
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>(
  (ref) {
    
    // Como tengo acceso al ref, puedo buscar un provider ya creado
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

    if( nowPlayingMovies.isEmpty ) return [];

    return nowPlayingMovies.sublist(0,6);

  }
);