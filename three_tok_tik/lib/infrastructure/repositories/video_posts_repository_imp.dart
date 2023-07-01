

import 'package:three_tok_tik/domain/datasource/video_posts_datasource.dart';
import 'package:three_tok_tik/domain/entities/video_post.dart';
import 'package:three_tok_tik/domain/repositories/video_posts_repository.dart';

class VidePostsRepositoryImpl implements  VideoPostRepository {

  final VideoPostDatasource videosDatasource;

  VidePostsRepositoryImpl({
    required this.videosDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    
    return videosDatasource.getTrendingVideosByPage(page);

    throw UnimplementedError();
  }

}