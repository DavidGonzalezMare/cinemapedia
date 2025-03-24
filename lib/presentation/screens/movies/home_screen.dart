import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
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
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    //if (slideShowMovies.isEmpty)
    //  return Center(child: CircularProgressIndicator());

    return Column(
      children: [
        CustomAppbar(),

        MoviesSlideshow(movies: slideShowMovies),

        MoviesHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subTitle: 'Lunes 20',
          loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        ),

        MoviesHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subTitle: 'Lunes 20',
          loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        ),
      ],
    );
  }
}

// Ya no utilizamos esto
class ListaAntigua extends StatelessWidget {
  const ListaAntigua({
    super.key,
    required this.nowPlayingMovies,
  });

  final List<Movie> nowPlayingMovies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: nowPlayingMovies.length,
          itemBuilder: (context, index) {
            final movie = nowPlayingMovies[index];
    
            return ListTile(
              title: Text(movie.title),
            );
          }),
    );
  }
}
