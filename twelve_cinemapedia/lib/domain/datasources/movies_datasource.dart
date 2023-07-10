
import 'package:twelve_cinemapedia/domain/entities/movie.dart';

abstract class MovieDataSource {
  // Define los métodos que éstas clases tendrán para traer la info

  Future<List<Movie>> getNowPlaying({ int page = 1 });

  Future<List<Movie>> getPopular({ int page = 1 });

  Future<List<Movie>> getUpcoming({ int page = 1 });

  Future<List<Movie>> getTopRated({ int page = 1 });

  Future<Movie> getMovieById( String id );

  Future<List<Movie>> searchMovies( String query );

}