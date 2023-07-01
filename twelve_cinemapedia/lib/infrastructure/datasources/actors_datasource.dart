
import 'package:dio/dio.dart';
import 'package:twelve_cinemapedia/config/constants/environment.dart';
import 'package:twelve_cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:twelve_cinemapedia/domain/entities/actor.dart';
import 'package:twelve_cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:twelve_cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {

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
  Future<List<Actor>> getActorsByMovie(String movieId) async{

    final response = await dio.get(
      "/movie/$movieId/credits"
    );

    // TODO: Procesar la entidad, esto con modelos y mappers

    final castResponse = CastResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    return actors;
  }

}