import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListStaggeredAnimation extends StatelessWidget {
  const ListStaggeredAnimation({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) => AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 300),
      child: SlideAnimation(
        horizontalOffset: 15,
        child: FadeInAnimation(
          child: child,
        ),
      ));
}
