import 'package:flutter/material.dart';

class IconTabWidget extends StatelessWidget {
  const IconTabWidget({
    @required this.child,
  });
 
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: child,
    );
  }
}