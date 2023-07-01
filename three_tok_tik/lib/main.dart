import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_tok_tik/config/theme/app_theme.dart';
import 'package:three_tok_tik/domain/repositories/video_posts_repository.dart';
import 'package:three_tok_tik/infrastructure/datasources/local_video_posts_ds.dart';
import 'package:three_tok_tik/presentation/screens/discover/discover_screen.dart';
import 'package:three_tok_tik/providers/discover_provider.dart';

import 'infrastructure/repositories/video_posts_repository_imp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VidePostsRepositoryImpl(
      videosDatasource: LocalVideoDatasource()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }

}