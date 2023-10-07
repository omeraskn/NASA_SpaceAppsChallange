import 'package:citylab/product/constants/utils/color_constants.dart';
import 'package:citylab/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../constants/utils/padding_constants.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final Widget? appbarLeading;
  final List<Widget>? appbarActions;
  const CustomScaffold({
    super.key,
    required this.child,
    this.appbarLeading,
    this.appbarActions,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: appbarLeading,
          actions: appbarActions,
        ),
        body: SafeArea(child: Padding(
          padding: AppPaddings.MEDIUM_V + AppPaddings.MEDIUM_H,
          child: child,
        )),
        backgroundColor: SurfaceColors.PRIMARY_COLOR,
      ),
    );
  }
}
