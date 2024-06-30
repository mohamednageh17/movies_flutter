import 'package:flutter/material.dart';

import '../../../data/remote/FetchMovies.dart';
import '../../../domain/model/MovieResponse.dart';
import '../../widgets/movie_list_widget.dart';

class MoviesList extends StatefulWidget {
  final String type;

  const MoviesList({super.key, required this.type});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late Future<MovieResponse> moviesFuture;

  @override
  void initState() {
    super.initState();
    moviesFuture = fetchPopularMovies(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return moviesFutureBuilder(moviesFuture);
  }
}
