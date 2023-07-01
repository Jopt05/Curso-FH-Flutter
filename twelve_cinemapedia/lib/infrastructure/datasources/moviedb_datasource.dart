
// Implementación del data source
import 'package:dio/dio.dart';
import 'package:twelve_cinemapedia/config/constants/environment.dart';
import 'package:twelve_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';
import 'package:twelve_cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:twelve_cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:twelve_cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDbDatasource extends MovieDataSource {

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.movieDbKey,
        "language": "es-MX",
      },
    )
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get(
      "/movie/now_playing",
      queryParameters: {
        "page": page
      }
    );

    // TODO: Procesar la entidad, esto con modelos y mappers

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    // Si no trae poster, sacalo
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async{

    final response = await dio.get(
      "/movie/popular",
      queryParameters: {
        "page": page
      }
    );

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{

    final response = await dio.get(
      "/movie/top_rated",
      queryParameters: {
        "page": page
      }
    );

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{

    final response = await dio.get(
      "/movie/upcoming",
      queryParameters: {
        "page": page
      }
    );

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }
  
  @override
  Future<Movie> getMovieById(String id) async {

    final response = await dio.get(
      '/movie/$id',
    );

    // Haciendo handle de la respuesta 
    if( response.statusCode != 200 ) throw Exception('Movie with id: $id not found');

    final movieDB = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDB);

    return movie;

  }

}