import 'package:flutter/material.dart';

class ConstrainedCentre extends StatelessWidget {
  const ConstrainedCentre({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Center(
          child: child,
        ));
  }
}
