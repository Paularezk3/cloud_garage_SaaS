import 'package:cloud_garage/common/components/default_text.dart';
import 'package:cloud_garage/core/constants/strings.dart';
import 'package:cloud_garage/core/utils/device_utils.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:cloud_garage/features/dashboard/domain/entities/metrics_card_item.dart';
import 'package:cloud_garage/features/dashboard/domain/entities/recent_customers_invoices.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import 'customer_table.dart';
import 'metrics_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'sales_graph.dart';

class DashboardBody extends StatelessWidget {
  final IResponsive responsive;
  final DeviceType deviceType;
  final List<MetricsCardItem> metrics;
  final RecentCustomersInvoices recentInvoices;
  const DashboardBody({
    required this.metrics,
    required this.recentInvoices,
    required this.deviceType,
    required this.responsive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final leftPadding = responsive.width(12);
    return SafeArea(
      child: Column(children: [
        Container(
          height: responsive.height(80),
          padding: EdgeInsets.symmetric(
              vertical: responsive.height(12), horizontal: leftPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: responsive.width(12)),
                child: DefaultText(
                  "Dashboard",
                  responsive: responsive,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (deviceType != DeviceType.mobile)
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
                                controller.clear(); // Example: clearing search
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                  if (deviceType == DeviceType.mobile)
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
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
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultText(
                    "Overview",
                    fontColor: AppColors.secondarySecondary,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    responsive: responsive,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: responsive.height(16),
                        bottom: responsive.height(16),
                        right: leftPadding),
                    child: MetricsCard(
                      isMobile: deviceType == DeviceType.mobile,
                      responsive: responsive,
                      metrics: metrics,
                    ),
                  ),
                  DefaultText(
                    "Analytics",
                    fontColor: AppColors.secondarySecondary,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    responsive: responsive,
                  ),
                  SizedBox(
                    height: responsive.height(8),
                  ),
                  // Analytics Section
                  if (deviceType == DeviceType.mobile) ...[
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: leftPadding,
                        ),
                        child: CustomerTable(
                          responsive: responsive,
                          recentInvoices: recentInvoices,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsive.height(16),
                    ),
                    DefaultText(
                      "Sales Graph",
                      fontColor: AppColors.secondarySecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      responsive: responsive,
                    ),
                    SizedBox(
                      height: responsive.height(12),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: leftPadding,
                        ),
                        child: SalesGraph(responsive: responsive),
                      ),
                    ),
                  ],
                  if (deviceType != DeviceType.mobile)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Customer Table Section
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: responsive.width(2),
                            ),
                            child: CustomerTable(
                              responsive: responsive,
                              recentInvoices: recentInvoices,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: responsive.width(2), right: leftPadding),
                            child: SalesGraph(responsive: responsive),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
