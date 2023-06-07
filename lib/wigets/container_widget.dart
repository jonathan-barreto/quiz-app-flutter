import 'package:flutter/material.dart';

class ContainerRadiusWidget extends StatelessWidget {
  const ContainerRadiusWidget({
    super.key,
    required this.width,
    required this.height,
    this.child,
    this.color = Colors.white,
  });

  final double width;
  final double height;
  final Widget? child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
