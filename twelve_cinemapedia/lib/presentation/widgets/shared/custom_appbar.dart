
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';
import 'package:twelve_cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:twelve_cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          // dale todo el ancho que puedas
          width: double.infinity,
          child: Row(
            children: [
              Icon( Icons.movie_outlined , color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle,),

              const Spacer(),

              IconButton(
                onPressed: () {

                  final movieRepository = ref.read( movieRepositoryProvider );
                  
                  final movie = showSearch<Movie?>(
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovies: movieRepository.searchMovies,
                    ),
                  ).then(
                    (movie) {
                      if( movie == null ) return;

                      context.push('/movie/${ movie.id }');
                    },
                  );

                },
                icon: const Icon( Icons.search ),
              )
            ],
          ),
        ),
      ),
    );
  }
}