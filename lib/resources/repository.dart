import 'package:movie_flutter/resources/movie_api_provider.dart';

import '../model/movies_response.dart';
import '../model/trailer_model.dart';

class Repository {
  final MovieApiProvider provider = MovieApiProvider();

  Future<MovieResponse> fetchMoviesList(String type) =>
      provider.fetchMovieList(type);

  Future<TrailerModel> fetchTrailers(int movieId) => provider.fetchTrailer(movieId);
}
