import 'package:movie_flutter/model/movies_response.dart';
import 'package:movie_flutter/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _movieFetcher = PublishSubject<MovieResponse>();

  Stream<MovieResponse> get allMovies => _movieFetcher.stream;

  fetchAllMovies(String type) async {
    MovieResponse response = await _repository.fetchMoviesList(type);
    _movieFetcher.sink.add(response);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final bloc = MoviesBloc();
