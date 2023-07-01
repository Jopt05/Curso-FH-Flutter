
import 'package:flutter/material.dart';
import 'package:three_tok_tik/domain/entities/video_post.dart';
import 'package:three_tok_tik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {

  // TODO: Opcional, clean architecture
    final VideoPostRepository videosRepository;

  // En cuanto inicie la aplicación, no tendré ningún vídeo, así que debo colocar ésta bandera 
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
  });

  Future<void> loadNextPage() async{

    // TODO: Cargar videos

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll( newVideos );
    
    initialLoading = false;

    notifyListeners();

  }

}