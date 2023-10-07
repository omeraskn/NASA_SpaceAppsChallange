import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

abstract class BaseViewModel{

  late BuildContext viewModelContext;

  void setContext(BuildContext context);
  void init();

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