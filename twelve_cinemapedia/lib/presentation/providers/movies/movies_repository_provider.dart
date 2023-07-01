
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:twelve_cinemapedia/infrastructure/repositories/movie_repository_impl.dart';

// Repositorio inmutable
final movieRepositoryProvider = Provider(
  (ref) {

    return MovieRepositoryImpl( MovieDbDatasource() );

  }
);