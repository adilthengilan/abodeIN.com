import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double height;
  const AppIcon({
    super.key,
    required this.iconData,
    required this.color,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: height,
    );
  }
}