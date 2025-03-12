

// Vamos a poner el MovieRepositroyImpl de manera global
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable.
final movieRepositoryProvider = Provider((ref) {
  // Aquí es donde por fin llamamos al datasource concreto...
  return MovieRepositoryImpl(MoviedbDatasource());
});