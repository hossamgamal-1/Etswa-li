import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridStaggeredAnimation extends StatelessWidget {
  const GridStaggeredAnimation(
      {super.key, required this.child, required this.listLength});

  final int listLength;
  final Widget child;
  @override
  Widget build(BuildContext context) => AnimationConfiguration.staggeredGrid(
      columnCount: listLength ~/ 2,
      position: 0,
      child: SlideAnimation(
        horizontalOffset: 10,
        verticalOffset: 10,
        duration: const Duration(milliseconds: 300),
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 300),
          child: child,
        ),
      ));
}
