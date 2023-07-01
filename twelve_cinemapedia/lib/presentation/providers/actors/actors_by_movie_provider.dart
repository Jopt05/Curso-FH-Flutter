

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/domain/entities/actor.dart';
import 'package:twelve_cinemapedia/presentation/providers/actors/actors_repository_provider.dart';

/*
  '5124': List<Actor>,
  '21312': List<Actor>
*/

// Definición de provider 
final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {
    final getMovie = ref.watch( actorsRepositoryProvider ).getActorsByMovie;
    return ActorsByMovieNotifier(
      getActors: getMovie,
    );
  }
);

// Definición del callback
typedef getActorsCallback = Future<List<Actor>>Function( String movieId );

class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {

  final getActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors
  }): super({});

  Future<void> loadActors( String movieId ) async {
    if( state[movieId] != null ) return;
    final List<Actor> actors = await getActors(movieId);

    state = {
      ...state,
      movieId: actors
    };
  }

}