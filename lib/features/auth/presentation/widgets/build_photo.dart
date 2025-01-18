import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/assets_path.dart';

class BuildPhoto extends StatelessWidget {
  final bool isMobile;
  const BuildPhoto({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Gradient
        Positioned.fill(
          child: Image.asset(
            AssetsPath
                .testBlueGradient, // Replace with your background image path
            fit: BoxFit.cover,
          ),
        ),
        // Background Image
        Positioned.fill(
          child: Image.asset(
            AssetsPath.serviceCenterPhoto,
            fit: BoxFit.cover,
          ),
        ),
        if (isMobile)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black
                    .withValues(alpha: 0.3), // Slightly dark overlay
              ),
            ),
          ),
      ],
    );
  }
}
