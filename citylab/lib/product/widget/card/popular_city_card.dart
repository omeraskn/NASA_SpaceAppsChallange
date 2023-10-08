import 'package:citylab/product/constants/utils/border_radius_constants.dart';
import 'package:citylab/product/constants/utils/color_constants.dart';
import 'package:citylab/product/constants/utils/padding_constants.dart';
import 'package:citylab/product/constants/utils/text_styles.dart';
import 'package:citylab/product/widget/buttons/custom_fill_button.dart';
import 'package:flutter/material.dart';

import '../../navigation/navigation_constants.dart';

class PopularCityCard extends StatelessWidget {
  final String imagePath;
  final String cityName;
  final int population;
  final String stateName;
  final void Function() onTap;
  const PopularCityCard(
      {super.key,
      required this.cityName,
      required this.population,
      required this.stateName,
      required this.imagePath, required this.onTap});

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
              child: Image.asset(imagePath,),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  cityName,
                  style:
                      TextStyles.MEDIUM.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  "Population: $population",
                  style: TextStyles.SMALL,
                ),
                Text(
                  "Capital: $stateName",
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
                    onTap: onTap,
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
