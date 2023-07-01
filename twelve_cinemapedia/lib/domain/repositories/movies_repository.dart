
import 'package:twelve_cinemapedia/domain/entities/movie.dart';

abstract class MovieRepository {
  // Llamará a la datasource para ejecutar el proceso

  Future<List<Movie>> getNowPlaying({ int page = 1 });

  Future<List<Movie>> getPopular({ int page = 1 });

  Future<List<Movie>> getUpcoming({ int page = 1 });

  Future<List<Movie>> getTopRated({ int page = 1 });

  Future<Movie> getMovieById( String id );

}