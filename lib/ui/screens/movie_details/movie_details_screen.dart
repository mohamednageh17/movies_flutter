import 'package:flutter/material.dart';
import 'package:movie_flutter/model/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movieModel;

  const MovieDetailsScreen({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieModel.title!),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded));
          },
        ),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/${movieModel.posterPath}',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
