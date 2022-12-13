import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({
    this.initFunction,
    this.disposeFunction,
    required this.child,
    super.key,
  });
  final Function? initFunction;
  final Function? disposeFunction;
  final Widget child;
  @override
  State<StatefulWrapper> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    super.initState();

    if (widget.initFunction != null) {
      widget.initFunction!();
    }
  }

  @override
  void dispose() {
    if (widget.disposeFunction != null) {
      widget.disposeFunction!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
