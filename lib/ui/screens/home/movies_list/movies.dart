import 'package:flutter/material.dart';
import 'package:movie_flutter/model/movies_response.dart';
import '../../../../blocs/movies_bloc.dart';
import '../../../../model/movie_model.dart';
import '../../../utils/rate_widget.dart';
import '../../movie_details/movie_details_screen.dart';

class MoviesList extends StatelessWidget {
  final String type;

  const MoviesList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies(type);
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildList(AsyncSnapshot<MovieResponse> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.results!.length,
        itemBuilder: (context, index) => Card(
              elevation: 5,
              borderOnForeground: true,
              semanticContainer: true,
              child: movieItemWidget(context, snapshot.data!.results![index]),
            ));
  }

  Widget movieItemWidget(BuildContext context, MovieModel item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movieModel: item)));
      },
      child: Column(
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
      ),
    );
  }
}
