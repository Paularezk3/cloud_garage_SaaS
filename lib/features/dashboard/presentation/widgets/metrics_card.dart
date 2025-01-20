import 'package:cloud_garage/core/constants/app_colors.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../common/components/default_text.dart';
import '../../domain/entities/metrics_card_item.dart';

class MetricsCard extends StatelessWidget {
  final IResponsive responsive;
  final List<MetricsCardItem> metrics;
  const MetricsCard({
    super.key,
    required this.metrics,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsive.height(250),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: metrics.length,
          itemBuilder: (context, index) {
            final metric = metrics[index];
            return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: responsive.height(250),
                  maxWidth: 250,
                  minWidth: 150),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(children: [
                  Card(
                    margin: EdgeInsets.only(top: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    color: metric.cardColor ?? AppColors.primarySecondary,
                    child: SizedBox(
                      width: responsive.width(100) < 170
                          ? 170
                          : responsive.width(100),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsive.width(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icon wrapped in a container
                            const SizedBox(height: 45),
                            // Title in the middle
                            DefaultText(
                              responsive: responsive,
                              metric.title,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(height: 5),
                            // Number at the bottom
                            DefaultText(
                              metric.metricNumber,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              responsive: responsive,
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: responsive.width(10),
                    top: 0,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: metric.iconBgColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          bottom: BorderSide(
                            color: metric.iconBgColor.withValues(
                              red: (metric.iconBgColor.r * 0.8).clamp(0, 255),
                              green: (metric.iconBgColor.g * 0.8).clamp(0, 255),
                              blue: (metric.iconBgColor.b * 0.8).clamp(0, 255),
                            ),
                            width: 2,
                          ),
                          right: BorderSide(
                            color: metric.iconBgColor.withValues(
                              red: (metric.iconBgColor.r * 0.8).clamp(0, 255),
                              green: (metric.iconBgColor.g * 0.8).clamp(0, 255),
                              blue: (metric.iconBgColor.b * 0.8).clamp(0, 255),
                            ),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          metric.icon,
                          size: 28,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(
                                  alpha: 0.3), // Slight shadow for the icon
                              offset: Offset(0, 3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
