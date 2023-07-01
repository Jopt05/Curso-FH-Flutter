
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/infrastructure/datasources/actors_datasource.dart';
import 'package:twelve_cinemapedia/infrastructure/repositories/actor_repository_impl.dart';

// Repositorio inmutable
final actorsRepositoryProvider = Provider(
  (ref) {

    return ActorRepositoryImpl( ActorMovieDbDatasource() );

  }
);