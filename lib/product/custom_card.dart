import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomCard extends StatelessWidget {
  late final double width;
  late final double height;
  late final Color background;
  late final Widget child;
  CustomCard({
    super.key,
    required this.width,
    required this.height,
    required this.background,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double _radius = 30;
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Container(
        width: width,
        height: height,
        child: Card(
          color: background,
          child: child,
        ),
      ),
    );
  }
}
