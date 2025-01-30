import 'package:cloud_garage/core/constants/app_colors.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../common/components/default_text.dart';
import '../../domain/entities/metrics_card_item.dart';

class MetricsCard extends StatelessWidget {
  final IResponsive responsive;
  final List<MetricsCardItem> metrics;
  final bool isMobile;

  const MetricsCard({
    super.key,
    required this.isMobile,
    required this.metrics,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = isMobile ? 2 : 3; // 2 columns on mobile, 3 on others
    final widgetHeight = 10 * (isMobile ? 2 : 1) + 130 * (isMobile ? 2 : 1);
    return SizedBox(
      height: responsive
          .height(widgetHeight * 1.0), // the 1.0 to make crossAxisCount double
      child: LayoutBuilder(builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth / crossAxisCount) -
            responsive.width(10); // Calculate card width

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: responsive.width(5), // Space between columns
            mainAxisSpacing: responsive.height(10), // Space between rows
            childAspectRatio: cardWidth / responsive.height(130), // Card ratio
          ),
          itemCount: metrics.length,
          itemBuilder: (context, index) {
            final metric = metrics[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              clipBehavior: Clip.hardEdge,
              color: AppColors.background,
              child: Stack(
                children: [
                  Positioned(
                    // Adjust shapes inside the cards based on index
                    right: index == 0 ? -50 : (index == 1 ? -100 : -110),
                    bottom: index == 0 ? -50 : (index == 1 ? -35 : -70),
                    height: responsive.height(200),
                    child: Image.asset(
                      metric.backgroundImage,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.width(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: responsive.height(15)),
                        DefaultText(
                          responsive: responsive,
                          metric.textTitle,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 5),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: responsive.width(10)),
                              Icon(Icons.monetization_on_rounded),
                              SizedBox(width: 12),
                              DefaultText(
                                metric.metricNumber,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                responsive: responsive,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(left: responsive.width(4)),
                          child: DefaultText(
                            responsive: responsive,
                            metric.subTitle,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
