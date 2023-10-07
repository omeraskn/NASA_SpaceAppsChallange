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
                  child: Image.network(
                    "https://picsum.photos/500",
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
                    DetailRow.string(title: "Population", valueString: "8,804,190"),
                    DetailRow.string(title: "State", valueString: "New York"),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 3.45)),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 3.2)),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 0.2)),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 2.56)),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 2.79)),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 4.8)),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 4)),
                    DetailRow.rating(title: "Earthquake Risk", valueWidget: RatingScale(rating: 4)),
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
