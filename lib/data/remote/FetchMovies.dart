import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/model/MovieResponse.dart';

Future<MovieResponse> fetchPopularMovies(String type) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$type?api_key=426bff346dfb35a5c824f8c3acddcc15'));

  final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
  return MovieResponse.fromJson(responseJson);
}
