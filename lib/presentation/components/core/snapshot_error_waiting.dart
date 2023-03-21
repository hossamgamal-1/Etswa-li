import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';

class SnapShotErrorWaitingHandler extends StatelessWidget {
  const SnapShotErrorWaitingHandler(
      {required this.snapShots, required this.child, super.key});
  final AsyncSnapshot snapShots;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return snapShots.hasError
        ? Center(
            child: Text('An error happend/n${snapShots.error}',
                style:
                    getRegularTextStyle(color: ColorManager.offerPriceColor)),
          )
        : snapShots.connectionState == ConnectionState.waiting
            ? const Center(
                child:
                    CircularProgressIndicator(color: ColorManager.primaryColor))
            : child;
  }
}
