import 'package:citylab/product/constants/utils/padding_constants.dart';
import 'package:citylab/product/constants/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:citylab/core/base/state/base_state.dart';
import 'package:citylab/product/widget/background/custom_scaffold.dart';
import '../../../product/constants/utils/color_constants.dart';
import '../../../product/navigation/navigation_constants.dart';
import '../../../product/widget/buttons/custom_fill_button.dart';
import '../../../product/widget/card/popular_city_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appbarLeading: const Icon(
          Icons.menu_rounded,
          color: AssetColors.SECONDARY_COLOR,
        ),
        appbarActions: const [
          Padding(
            padding: AppPaddings.SMALL_H,
            child: Icon(
              Icons.search,
              color: AssetColors.SECONDARY_COLOR,
            ),
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: AppPaddings.MEDIUM_V,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Find the best state for you!",
                      style: TextStyles.LARGE
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    buildOrderPageButton(context),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "POPULAR STATES",
                    style:
                        TextStyles.LARGE.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                                          children: [
                        PopularCityCard(
                            cityName: "New York City",
                            imagePath: "assets/images/newyork.jpg",
                            population: 37146680,
                            stateName: "New York",
                            onTap: () => Navigator.of(context)
                                .pushNamed(NavigationConstants.CITY_DETAIL_VIEW)),
                        PopularCityCard(
                            cityName: "Hawaii",
                            imagePath: "assets/images/hawaii.jpeg",
                            population: 1917481,
                            stateName: "Honolulu",
                            onTap: () => Navigator.of(context).pushNamed(
                                NavigationConstants.HCITY_DETAIL_VIEW)),
                        PopularCityCard(
                            cityName: "Arkansas",
                            imagePath: "assets/images/arkansas.jpg",
                            population: 2689595,
                            stateName: "Little Rock",
                            onTap: () {}),
                                          ],
                                        ),
                      )),
                ],
              ),
            )
          ],
        ));
  }

  CustomFillButton buildOrderPageButton(BuildContext context) {
    return CustomFillButton(
      text: "LET'S START",
      textStyle: TextStyles.BUTTON_MEDIUM,
      backgroundcolor: SurfaceColors.BUTTON_SECONDARY_COLOR,
      padding: AppPaddings.MEDIUM_V + AppPaddings.LARGE_H,
      onTap: () =>
          Navigator.of(context).pushNamed(NavigationConstants.ORDER_STATS_VIEW),
    );
  }
}
