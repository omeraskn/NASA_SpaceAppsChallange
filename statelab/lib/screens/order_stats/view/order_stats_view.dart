import 'package:citylab/core/base/state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:citylab/product/constants/utils/border_radius_constants.dart';
import 'package:citylab/product/constants/utils/color_constants.dart';
import 'package:citylab/product/constants/utils/padding_constants.dart';
import 'package:citylab/product/constants/utils/text_styles.dart';
import 'package:citylab/product/widget/background/custom_scaffold.dart';
import 'package:citylab/product/widget/buttons/custom_fill_button.dart';

import '../../../product/navigation/navigation_constants.dart';

class OrderStatsView extends StatefulWidget {
  OrderStatsView({super.key});
  final List<String> items = [
    "Clients",
    "Designer",
    "Developer",
    "Director",
    "Employee",
    "Manager",
    "Worker",
  ];
  @override
  State<OrderStatsView> createState() => _OrderStatsViewState();
}

class _OrderStatsViewState extends BaseState<OrderStatsView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 12,
            child: Container(
              padding: AppPaddings.MEDIUM_V,
              decoration: BoxDecoration(
                  color: SurfaceColors.SECONDARY_COLOR,
                  borderRadius: AppBorderRadius.MEDIUM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: AppPaddings.MEDIUM_H + AppPaddings.SMALL_V,
                    child: const Text(
                      "List them in order",
                      style: TextStyles.LARGE,
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: SizedBox(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: ReorderableListView(
                          physics: const NeverScrollableScrollPhysics(),
                          buildDefaultDragHandles: false,
                          children: <Widget>[
                            for (int index = 0;
                                index < widget.items.length;
                                index++)
                              ReorderableDragStartListener(
                                index: index,
                                key: ValueKey(widget.items[index]),
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  margin: AppPaddings.MEDIUM_H +
                                      AppPaddings.SMALL_V,
                                  child: ListTile(
                                    horizontalTitleGap: 0,
                                    leading: const Icon(
                                      Icons.menu_rounded,
                                      color: AssetColors.PRIMARY_COLOR,
                                    ),
                                    tileColor: SurfaceColors.LISTILE_COLOR,
                                    title: Text(
                                      widget.items[index],
                                      style: TextStyles.SMALL,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: AppBorderRadius.MEDIUM),
                                  ),
                                ),
                              ),
                          ],
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              if (newIndex > oldIndex) {
                                newIndex -= 1;
                              }
                              final items = widget.items.removeAt(oldIndex);
                              widget.items.insert(newIndex, items);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: CustomFillButton(
                text: "SEARCH",
                textStyle: TextStyles.BUTTON_MEDIUM,
                backgroundcolor: SurfaceColors.BUTTON_PRIMARY_COLOR,
                padding: AppPaddings.MEDIUM_V + AppPaddings.LARGE_H,
                onTap: () => Navigator.of(context)
                    .pushNamed(NavigationConstants.CITY_DETAIL_VIEW),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
