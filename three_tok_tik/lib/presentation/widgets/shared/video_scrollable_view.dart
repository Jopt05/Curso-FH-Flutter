
import 'package:flutter/material.dart';
import 'package:three_tok_tik/domain/entities/video_post.dart';
import 'package:three_tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:three_tok_tik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
    });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // Video player +  Gradiente
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl
              )
            ),

            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButton(
                video: videoPost,
              ),
            )
          ],
        );
      },
    );
  }
}