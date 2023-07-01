
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {

  final List<Movie> movies;
  
  const MoviesSlideShow({
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    // Declaramos alto o ancho especifico 
    return SizedBox(
      height: 210,
      // Todo el ancho posible
      width: double.infinity,
      child: Swiper(
        // Permite ver un poco del slide anterior o el siguiente
        viewportFraction: 0.8,
        // Disminuye el tamaño de la tarjeta 
        autoplay: true,
        // Permite la paginación
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary
          )
        ),
        scale: 0.9,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(-2, 10)
        ),
      ]
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        // Permite añadir formas redondeadas 
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if ( loadingProgress != null ) {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black12
                  ),
                );
              }

              return FadeIn(
                child: child,
              );
            },
          ),
        ),
      )
    );
  }
}