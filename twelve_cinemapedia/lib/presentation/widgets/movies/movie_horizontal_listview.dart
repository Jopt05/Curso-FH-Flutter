import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twelve_cinemapedia/config/helpers/human_formats.dart';
import 'package:twelve_cinemapedia/domain/entities/movie.dart';

class MovieHorizontalListwiew extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  // Es opcional por que tal vez no quiera cargar más películas
  final VoidCallback? loadNextPage;

  const MovieHorizontalListwiew(
      {super.key, required this.movies, this.title, this.subTitle, this.loadNextPage});

  @override
  State<MovieHorizontalListwiew> createState() => _MovieHorizontalListwiewState();
}

class _MovieHorizontalListwiewState extends State<MovieHorizontalListwiew> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      
      if ( widget.loadNextPage == null ) return;

      // Si llega a superar la posición máxima
      if ( (scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent ){
        
        widget.loadNextPage!();

      }

    });

  }
  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          
          if ( widget.title != null || widget.subTitle != null )
           _Title(
              label: widget.title,
              subTitle: widget.subTitle,
            ),

          // Necesito que el listview tenga un tamaño en especifico
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              // Cambiar direccion 
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final Movie movie = widget.movies[index];
                return _Slide(movie: movie);
              },
            ),
          )

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if ( loadingProgress != null ) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: () => context.push('/movie/${ movie.id }'),
                    child: FadeIn(
                      child: child,
                    ),
                  );
                },
              ),
            )
          ),

          const SizedBox(
            height: 5,
          ),
          // Titulo


          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall
            ),
          ),

          // Rating
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon( 
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(width: 3,),
                Text(
                  '${ movie.voteAverage }',
                  style: textStyles.bodyMedium?.copyWith(
                    color: Colors.yellow.shade800
                  ),
                ),
                const Spacer(),
                Text(
                  HumanFormats.number(movie.popularity),
                  style: textStyles.bodySmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {

  final String? label;
  final String? subTitle;

  const _Title({super.key, this.label, this.subTitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [

          if( label != null )
          Text(
            label!,
            style: titleStyle,
          ),

          const Spacer(),

          if( subTitle != null )
          FilledButton.tonal(
            style: const ButtonStyle(
              visualDensity: VisualDensity.compact
            ),
            onPressed: () {},
            child: Text(subTitle!),
          ),

        ],
      ),
    );
  }
}