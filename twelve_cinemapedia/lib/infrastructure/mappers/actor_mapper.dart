import 'package:twelve_cinemapedia/domain/entities/actor.dart';
import 'package:twelve_cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  // Viene de la entity
  static Actor castToEntity( Cast cast ) =>
      Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://ih1.redbubble.net/image.1893341687.8294/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
        character: cast.character
      );
}
