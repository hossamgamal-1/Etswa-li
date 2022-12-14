import 'package:flutter/material.dart';

import '../../../core/themes/app_text_styles.dart';
import '../../../core/themes/app_light_theme.dart';

class SnapShotErrorWaitingHandler extends StatelessWidget {
  const SnapShotErrorWaitingHandler(
      {required this.snapShots, required this.child, super.key});
  final AsyncSnapshot snapShots;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return snapShots.hasError
        ? Center(
            child: Text(
              'An error happend/n${snapShots.error}',
              style: AppTextStyles.categoryChipTextStyle
                  .copyWith(color: AppLightTheme.offerPriceColor),
            ),
          )
        : snapShots.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(
                    color: AppLightTheme.unSelectedIconColor))
            : child;
  }
}
