import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../model/movies_response.dart';
import '../model/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _baseUrl = 'https://api.themoviedb.org/3/movie';
  final _apiKey = '426bff346dfb35a5c824f8c3acddcc15';

  Future<MovieResponse> fetchMovieList(String type) async {
    final response =
    await client.get(Uri.parse('$_baseUrl/$type?api_key=$_apiKey'));

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(responseJson);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
    await client.get(Uri.parse('$_baseUrl/$movieId/videos?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
