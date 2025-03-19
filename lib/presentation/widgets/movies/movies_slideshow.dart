import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';



class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      // Para hacer un scroll horizontal.
      child: Swiper(                
        viewportFraction: 0.8, // Para que se vean los de al lado
        scale: 0.9,        
        autoplay: true, // Para que vaya cambiando solo
        pagination: SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary

          )
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movie: movies[index])
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
        color: Colors.black45,      
        blurRadius: 10,
        offset: Offset(0, 10),
        ),
      ]
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,      
        child:  ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress != null) { // Está cargando
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12)
                );
              } 

              return FadeIn(child: child);

            },
          )
        ),
        ),
    );
  }
}