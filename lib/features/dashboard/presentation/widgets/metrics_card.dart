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
      height: responsive.height(130),
      child: LayoutBuilder(builder: (context, constraints) {
        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: metrics.length,
            itemBuilder: (context, index) {
              final metric = metrics[index];
              final cardWidth = (constraints.maxWidth) / 3;
              return SizedBox(
                width: cardWidth,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  clipBehavior: Clip.hardEdge,
                  color: AppColors.background,
                  child: Stack(children: [
                    Positioned(
                      right: index == 0 ? -50 : (index == 1 ? -100 : -110),
                      bottom: index == 0 ? -50 : (index == 1 ? -35 : -70),
                      height: responsive.height(200),
                      child: Image.asset(
                        metric.backgroundImage,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsive.width(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icon wrapped in a container
                          SizedBox(height: responsive.height(15)),
                          // Title in the middle
                          DefaultText(
                            responsive: responsive,
                            metric.textTitle,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 5),
                          // Number at the bottom
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: responsive.width(10),
                                ),
                                Icon(Icons.monetization_on_rounded),
                                SizedBox(
                                  width: 12,
                                ),
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
                  ]),
                ),
              );
            });
      }),
    );
  }
}
