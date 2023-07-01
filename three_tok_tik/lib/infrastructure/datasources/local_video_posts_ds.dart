
import 'package:three_tok_tik/domain/datasource/video_posts_datasource.dart';

import '../../domain/entities/video_post.dart';
import '../../shared/data/local_video_post.dart';
import '../models/local_video_model.dart';

class LocalVideoDatasource implements VideoPostDatasource{

  @override
  Future<List<VideoPost>> getTrendingVideosByPage( int page ) async {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser( String userId ) async {
    
    await Future.delayed(
      const Duration( seconds: 2 )
    );

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    ).toList();

    return newVideos;
  }

}