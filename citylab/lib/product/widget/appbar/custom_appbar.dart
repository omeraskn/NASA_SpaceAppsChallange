import 'package:flutter/material.dart';
import '../../constants/utils/color_constants.dart';
import '../../constants/utils/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  const CustomAppBar({
    super.key,
    this.leading,
    this.actions,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      backgroundColor: SurfaceColors.APPBAR_COLOR,
      iconTheme: const IconThemeData(color: AssetColors.SECONDARY_COLOR),
      centerTitle: true,
      title: Text(
        "CITYLAB",
        style: TextStyles.APP_NAME.copyWith(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
    );
  }
}
