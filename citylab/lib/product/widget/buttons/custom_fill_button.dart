import 'package:flutter/material.dart';
import '../../constants/utils/border_radius_constants.dart';
import '../../constants/utils/color_constants.dart';

class CustomFillButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundcolor;
  final EdgeInsets padding;
  final void Function() onTap;

  const CustomFillButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.textStyle,
    required this.backgroundcolor,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius.MEDIUM,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          overlayColor:
              const MaterialStatePropertyAll(SurfaceColors.SECONDARY_COLOR),
          onTap: onTap,
          child: Ink(
            color: backgroundcolor,
            padding: padding,
            child: Text(
              text,
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
