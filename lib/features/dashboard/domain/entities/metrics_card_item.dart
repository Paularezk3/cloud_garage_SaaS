import 'package:flutter/material.dart';

class MetricsCardItem {
  final String textTitle;
  final String metricNumber;
  final Color iconBgColor;
  final IconData icon;
  final String subTitle;
  final String backgroundImage;
  MetricsCardItem(
      {required this.subTitle,
      required this.iconBgColor,
      required this.backgroundImage,
      required this.icon,
      required this.metricNumber,
      required this.textTitle});
}
