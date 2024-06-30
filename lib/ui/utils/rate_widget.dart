import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  const StarRating(
      {super.key, this.starCount = 5,
      this.rating = .0});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star_border,
        color: Colors.blueAccent,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = const Icon(
        Icons.star_half,
        color: Colors.blueAccent,
      );
    } else {
      icon = const Icon(
        Icons.star,
        color: Colors.blueAccent,
      );
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
