import 'package:cloud_garage/common/components/default_text.dart';
import 'package:cloud_garage/core/constants/strings.dart';
import 'package:cloud_garage/core/utils/device_utils.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:cloud_garage/features/dashboard/domain/entities/metrics_card_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import 'metrics_card.dart';
import 'overview_metrics.dart';
import 'quick_actions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardBody extends StatelessWidget {
  final IResponsive responsive;
  final DeviceType deviceType;
  final List<MetricsCardItem> metrics;
  const DashboardBody({
    required this.metrics,
    required this.deviceType,
    required this.responsive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (deviceType != DeviceType.mobile)
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(
              vertical: responsive.height(12),
              horizontal: responsive.width(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: responsive.width(12)),
                child: DefaultText(
                  "Dashboard",
                  responsive: responsive,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SearchAnchor(
                      suggestionsBuilder: (context, controller) async {
                        return [];
                      },
                      builder: (context, controller) => TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.primarySecondary,
                          hintText: "Search",
                          hintStyle: TextStyle(
                              fontFamily: Strings.fontFamilyName(
                                  AppLocalizations.of(context)!.localeName ==
                                      "ar")),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Trigger any action when the icon is clicked
                              controller.clear(); // Example: clearing search
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Icon(
                                Icons.search,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      Expanded(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.width(12),
                    vertical: responsive.height(16)),
                child: MetricsCard(
                  responsive: responsive,
                  metrics: metrics,
                ),
              ),
              // Quick Actions Section
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.width(12),
                    vertical: responsive.height(16)),
                child: QuickActions(),
              ),
              // Overview Metrics Section
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.width(12),
                    vertical: responsive.height(16)),
                child: OverviewMetrics(),
              ),
              // Quick Actions Section
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.width(12),
                    vertical: responsive.height(16)),
                child: QuickActions(),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
