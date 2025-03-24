

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

// En ref están todos nuestros providers
final moviesSlideshowProvider = Provider <List<Movie>>((ref){
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if(nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});