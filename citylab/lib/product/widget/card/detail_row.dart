import 'package:flutter/material.dart';

import '../../constants/utils/text_styles.dart';

class DetailRow extends StatelessWidget {
  
  final String title;
  String? valueString;
  Widget? valueWidget;

  DetailRow.string({super.key, required this.title, required this.valueString});
  DetailRow.rating({super.key, required this.title, required this.valueWidget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              "$title:",
              style: TextStyles.SMALL,
            ),
          ),
          Expanded(
            flex: 4,
            child: valueWidget ?? Text(valueString!, style: TextStyles.SMALL,) 
          ),
        ],
      ),
    );
  }
}
