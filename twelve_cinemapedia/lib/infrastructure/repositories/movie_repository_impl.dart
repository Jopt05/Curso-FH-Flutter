
import 'package:twelve_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';
import 'package:twelve_cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MovieRepository {

  final MovieDataSource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {

    return datasource.getNowPlaying(page: page);

  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    

    return datasource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) {
    return datasource.searchMovies(query);
  }

}