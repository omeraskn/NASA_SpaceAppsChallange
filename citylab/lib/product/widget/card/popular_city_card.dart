import 'package:citylab/product/constants/utils/border_radius_constants.dart';
import 'package:citylab/product/constants/utils/color_constants.dart';
import 'package:citylab/product/constants/utils/padding_constants.dart';
import 'package:citylab/product/constants/utils/text_styles.dart';
import 'package:citylab/product/widget/buttons/custom_fill_button.dart';
import 'package:flutter/material.dart';

import '../../navigation/navigation_constants.dart';

class PopularCityCard extends StatelessWidget {
  const PopularCityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.MEDIUM_V,
      padding: AppPaddings.MEDIUM_V + AppPaddings.MEDIUM_H,
      decoration: BoxDecoration(
          color: SurfaceColors.SECONDARY_COLOR,
          borderRadius: AppBorderRadius.MEDIUM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: AppBorderRadius.MEDIUM,
              child: Image.network(
                "https://picsum.photos/500",
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "New York City",
                  style:
                      TextStyles.MEDIUM.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Population: 8,804,190",
                  style: TextStyles.SMALL,
                ),
                const Text(
                  "State: New York ",
                  style: TextStyles.SMALL,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomFillButton(
                    text: "Details",
                    textStyle: TextStyles.BUTTON_SMALL,
                    backgroundcolor: SurfaceColors.BUTTON_PRIMARY_COLOR,
                    padding: AppPaddings.SMALL_V + AppPaddings.MEDIUM_H,
                    onTap: () => Navigator.of(context)
                        .pushNamed(NavigationConstants.CITY_DETAIL_VIEW),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
