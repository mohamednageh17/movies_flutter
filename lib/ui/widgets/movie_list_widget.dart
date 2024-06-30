import 'package:flutter/material.dart';

import '../../domain/model/MovieModel.dart';

import '../../domain/model/MovieResponse.dart';
import '../utils/RateWidget.dart';

Widget moviesFutureBuilder(Future<MovieResponse> moviesFuture) {
  return FutureBuilder(
      future: moviesFuture,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return moviesListWidget(snapShot.data!.results!);
        } else if (snapShot.hasError) {
          return Text(snapShot.error.toString(),
              style: const TextStyle(color: Colors.red));
        }
        return const CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          color: Colors.blueAccent,
        );
      });
}

Widget moviesListWidget(List<MovieModel> list) {
  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) =>
          Card(elevation: 5, child: movieItemWidget(list[index])));
}

Widget movieItemWidget(MovieModel item) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/${item.posterPath}',
          fit: BoxFit.scaleDown,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    item.title!,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                StarRating(
                  rating: item.voteAverage! / 2,
                  starCount: 5,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.overview!,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                wordSpacing: 2,
              ),
              textAlign: TextAlign.start,

            ),
          ],
        ),
      )
    ],
  );
}
