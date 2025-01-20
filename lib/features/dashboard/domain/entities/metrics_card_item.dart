import 'package:flutter/material.dart';

class MetricsCardItem {
  final String title;
  final String metricNumber;
  final Color iconBgColor;
  final Color? cardColor;
  final IconData icon;
  MetricsCardItem(
      {this.cardColor,
      required this.iconBgColor,
      required this.icon,
      required this.metricNumber,
      required this.title});
}
