import 'package:citylab/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {

  ThemeData get themeData => Theme.of(context);

  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  TextTheme get textTheme => Theme.of(context).textTheme;

  double get height => MediaQuery.of(context).size.height;

  double get width => MediaQuery.of(context).size.width;

  double get topPadding => MediaQuery.of(context).padding.top;

  double get bottomPadding => MediaQuery.of(context).padding.bottom;

  double dynamicHeightDevice(double value) =>
      MediaQuery.of(context).size.height * value;
      
  double dyanmicWidthDevice(double value) =>
      MediaQuery.of(context).size.width * value;

  double dynamicHeightDesign(double value) =>
      (height - topPadding - bottomPadding) /
      AppConstants.DESIGN_DEVICE_HEIGHT *
      value;

  double dynamicWidthDesign(double value) =>
      width / AppConstants.DESIGN_DEVICE_WIDTH * value;
}

abstract class BaseStatelessWidget extends StatelessWidget{
  const BaseStatelessWidget({super.key});

  ThemeData themeData(BuildContext context) => Theme.of(context);

  ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  DividerThemeData dividerTheme(BuildContext context) =>
      Theme.of(context).dividerTheme;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;

  double bottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  double dynamicHeightDevice(BuildContext context, double value) =>
      MediaQuery.of(context).size.height * value;
      
  double dyanmicWidthDevice(BuildContext context, double value) =>
      MediaQuery.of(context).size.width * value;

  double dynamicHeightDesign(BuildContext context, double value) =>
      (height(context) - topPadding(context) - bottomPadding(context)) /
      AppConstants.DESIGN_DEVICE_HEIGHT *
      value;

  double dynamicWidthDesign(BuildContext context, double value) =>
      width(context) / AppConstants.DESIGN_DEVICE_WIDTH * value;
}
