import 'package:flutter/material.dart';

class SnapShotErrorWaitingHandler extends StatelessWidget {
  const SnapShotErrorWaitingHandler(
      {required this.snapShots, required this.child, super.key});
  final AsyncSnapshot snapShots;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return snapShots.hasError
        ? const Center(
            child: Text(
              'An error happend',
              style: TextStyle(color: Colors.red),
            ),
          )
        : snapShots.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator(color: Colors.grey))
            : child;
  }
}
