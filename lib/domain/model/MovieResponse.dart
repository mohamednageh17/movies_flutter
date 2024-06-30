import 'MovieModel.dart';

class MovieResponse {
  int? page;
  List<MovieModel>? results;

  MovieResponse({
    this.page,
    this.results,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    final page = json['page'] as int?;
    final results = (json['results'] as List<dynamic>?)?.map<MovieModel>((result) {
      return MovieModel.fromJson(result as Map<String, dynamic>);
    }).toList();

    if (page != null && results != null) {
      return MovieResponse(page: page, results: results);
    } else {
      throw const FormatException('Failed to load response.');
    }
  }
}
