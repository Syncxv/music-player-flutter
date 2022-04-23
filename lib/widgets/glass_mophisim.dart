import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphsim extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;
  final Color color;
  const GlassMorphsim({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              // border: Border.all(
              //   width: 1.5,
              //   color: color.withOpacity(0.2),
              // ),
            ),
            child: child,
          ),
        ));
  }
}
