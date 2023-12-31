import 'package:citylab/product/widget/background/custom_scaffold.dart';
import 'package:citylab/product/widget/card/detail_row.dart';
import 'package:citylab/product/widget/rating/rating_scale.dart';
import 'package:flutter/material.dart';

import '../../../product/constants/utils/border_radius_constants.dart';
import '../../../product/constants/utils/color_constants.dart';
import '../../../product/constants/utils/padding_constants.dart';
import '../../../product/constants/utils/text_styles.dart';

class CityDetailView extends StatefulWidget {
  const CityDetailView({super.key});

  @override
  State<CityDetailView> createState() => _CityDetailViewState();
}

class _CityDetailViewState extends State<CityDetailView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Container(
        padding: AppPaddings.MEDIUM_V,
        decoration: BoxDecoration(
            color: SurfaceColors.SECONDARY_COLOR,
            borderRadius: AppBorderRadius.MEDIUM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: AppPaddings.LARGE_H + AppPaddings.MEDIUM_V,
                child: ClipRRect(
                  borderRadius: AppBorderRadius.MEDIUM,
                  child: Image.asset(
                    "assets/images/newyork.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "New York City",
                  textAlign: TextAlign.center,
                  style: TextStyles.LARGE.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Padding(
                padding: AppPaddings.MEDIUM_H,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailRow.string(title: "Population", valueString: "8804190"),
                    DetailRow.string(title: "Capital", valueString: "New York"),
                    DetailRow.string(title: "GDP", valueString: "2.053 Trillion"),
                    DetailRow.string(title: "Air Quality Index", valueString: "Good"),
                    DetailRow.string(title: "Public Transportation", valueString: "Rank #1"),
                    DetailRow.string(title: "Green Space Rate", valueString: "Rank #15"),
                    Spacer(),
                    DetailRow.rating(title: "Death Rate", valueWidget: RatingScale(rating: 3.5)),
                    DetailRow.rating(title: "Population Density", valueWidget: RatingScale(rating: 4)),
                    DetailRow.rating(title: "Electrical Pricing", valueWidget: RatingScale(rating: 2.31)),
                    DetailRow.rating(title: "Health Condition", valueWidget: RatingScale(rating: 1.12)),
                    DetailRow.rating(title: "Water Quality", valueWidget: RatingScale(rating: 4.44)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
