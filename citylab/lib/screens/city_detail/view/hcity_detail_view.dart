import 'package:citylab/product/widget/background/custom_scaffold.dart';
import 'package:citylab/product/widget/card/detail_row.dart';
import 'package:citylab/product/widget/rating/rating_scale.dart';
import 'package:flutter/material.dart';

import '../../../product/constants/utils/border_radius_constants.dart';
import '../../../product/constants/utils/color_constants.dart';
import '../../../product/constants/utils/padding_constants.dart';
import '../../../product/constants/utils/text_styles.dart';

class HCityDetailView extends StatefulWidget {
  const HCityDetailView({super.key});

  @override
  State<HCityDetailView> createState() => _HCityDetailViewState();
}

class _HCityDetailViewState extends State<HCityDetailView> {
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
                    "assets/images/hawaii.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "Hawaii",
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
                    DetailRow.string(title: "Population", valueString: "1919481"),
                    DetailRow.string(title: "Capital", valueString: "Honolulu"),
                    DetailRow.string(title: "GDP", valueString: "98.218 Billion"),
                    DetailRow.string(title: "Air Quality Index", valueString: "Very Good"),
                    DetailRow.string(title: "Public Transportation", valueString: "Rank #3"),
                    DetailRow.string(title: "Green Space Rate", valueString: "Rank #2"),
                    Spacer(),
                    DetailRow.rating(title: "Death Rate", valueWidget: RatingScale(rating: 4.89)),
                    DetailRow.rating(title: "Population Density", valueWidget: RatingScale(rating: 2)),
                    DetailRow.rating(title: "Electrical Pricing", valueWidget: const Text("*No info*", style: TextStyles.SMALL,)),
                    DetailRow.rating(title: "Health Condition", valueWidget: const Text("*No info*", style: TextStyles.SMALL,)),
                    DetailRow.rating(title: "Water Quality", valueWidget: RatingScale(rating: 0.1)),
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
