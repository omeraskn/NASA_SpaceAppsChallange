import 'package:citylab/product/constants/utils/color_constants.dart';
import 'package:flutter/material.dart';

class RatingScale extends StatelessWidget {
  final int starCount = 5;
  final double rating;
  late int fullStars;
  late int emptyStars;
  bool isLastHalf = false;

  RatingScale({
    super.key,
    required this.rating,
  }) {
    fullStars = rating.floor();
    if (0.25 < rating - fullStars) {
      if (0.75 > rating - fullStars) {
        isLastHalf = true;
      } else {
        fullStars++;
      }
    }
    emptyStars = starCount - fullStars;
    if (isLastHalf) emptyStars--;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: fullStars,
          itemBuilder: (BuildContext context, int index) {
            return const Icon(
              Icons.star,
              color: AssetColors.PRIMARY_COLOR,
            );
          },
        ),
        isLastHalf
            ? const Icon(
                Icons.star_half,
                color: AssetColors.PRIMARY_COLOR,
              )
            : const SizedBox(),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: emptyStars,
          itemBuilder: (BuildContext context, int index) {
            return const Icon(
              Icons.star_border,
              color: AssetColors.PRIMARY_COLOR,
            );
          },
        ),
      ],
    );
  }
}
