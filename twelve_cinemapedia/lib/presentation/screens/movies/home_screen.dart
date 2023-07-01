

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/initial_loader_provider.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:twelve_cinemapedia/presentation/screens/screens.dart';
import 'package:twelve_cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:twelve_cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(
        
      ),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch( initialLoaderProvider );
    if ( initialLoading ) return FullScreenLoader();

    final slideShowMovies = ref.watch( moviesSlideShowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: CustomAppBar(),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // const CustomAppBar(
              
                    // ),
              
                    MoviesSlideShow(
                      movies: slideShowMovies,
                    ),
              
                    MovieHorizontalListwiew(
                      movies: nowPlayingMovies,
                      title: 'En cines',
                      subTitle: 'Lunes 20',
                      loadNextPage: (() {
                      ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
                      }),
                    ),
                    MovieHorizontalListwiew(
                      movies: popularMovies,
                      title: 'Populares',
                      subTitle: 'Lunes 20',
                      loadNextPage: (() {
                      ref.read( popularMoviesProvider.notifier ).loadNextPage();
                      }),
                    ),
                    MovieHorizontalListwiew(
                      movies: upcomingMovies,
                      title: 'Pronto',
                      subTitle: 'Lunes 20',
                      loadNextPage: (() {
                      ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
                      }),
                    ),
                    MovieHorizontalListwiew(
                      movies: topRatedMovies,
                      title: 'Top Rated',
                      subTitle: 'Lunes 20',
                      loadNextPage: (() {
                      ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
                      }),
                    ),

                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              );
            },
            childCount: 10
          ),
        )
      ]
    );
  }
}