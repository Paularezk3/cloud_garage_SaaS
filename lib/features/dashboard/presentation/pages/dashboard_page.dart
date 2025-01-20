import 'package:cloud_garage/config/setup_dependencies.dart';
import 'package:cloud_garage/core/constants/app_colors.dart';
import 'package:cloud_garage/core/utils/device_utils.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:cloud_garage/features/dashboard/domain/entities/metrics_card_item.dart';
import 'package:cloud_garage/features/dashboard/domain/entities/navigation_bar_items.dart';
import 'package:cloud_garage/features/dashboard/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboard_body.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final IDeviceUtils deviceUtils = getIt<IDeviceUtils>();
    final DeviceType deviceType = deviceUtils.getDeviceType(context);
    final bool isMobile = deviceType == DeviceType.mobile;
    final double navigationWidth = !isMobile ? 280 : 0;
    final IResponsive responsive = getIt<IResponsive>();
    final metrics = [
      MetricsCardItem(
        icon: Icons.inventory_2,
        title: "Sales",
        metricNumber: "20,200",
        iconBgColor: AppColors.primaryPrimary,
      ),
      MetricsCardItem(
        icon: Icons.inventory_2,
        title: "Customers",
        metricNumber: "30",
        iconBgColor: AppColors.primaryPrimary,
      ),
      MetricsCardItem(
        icon: Icons.inventory_2,
        title: "Customers",
        metricNumber: "30",
        iconBgColor: AppColors.primaryPrimary,
      ),
    ];
    final navigationBarItems = [
      NavigationBarItems(
          itemIcon: Icons.dashboard_rounded, itemName: 'Dashboard'),
      NavigationBarItems(
          itemIcon: Icons.person, itemName: 'Profile Management'),
      NavigationBarItems(
          itemIcon: Icons.car_repair, itemName: 'Customer & Vehicle'),
      NavigationBarItems(
          itemIcon: Icons.inventory, itemName: 'Inventory Management'),
      NavigationBarItems(itemIcon: Icons.payment, itemName: 'Payroll'),
      NavigationBarItems(itemIcon: Icons.receipt, itemName: 'Billing'),
      NavigationBarItems(
          itemIcon: Icons.bar_chart, itemName: 'Analytics & Reports'),
    ];

    return Scaffold(
        appBar: isMobile
            ? AppBar(
                title: const Text('Dashboard'),
                backgroundColor: Colors.blueAccent,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notifications
                    },
                  ),
                ],
              )
            : null,
        backgroundColor: AppColors.primaryPrimaryLight,
        drawer: Drawer(
          child: CustomNavigationBar(
            responsive: responsive,
            navigationBarItems: navigationBarItems,
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!isMobile) ...[
              SizedBox(
                width: navigationWidth,
                child: CustomNavigationBar(
                    responsive: responsive,
                    navigationBarItems: navigationBarItems),
              ),
              SizedBox(
                width: 20,
              ),
            ],
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background.withValues(alpha: 0.8),
                  borderRadius: !isMobile
                      ? BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        )
                      : null,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.blueGrey.withValues(alpha: 0.2),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: DashboardBody(
                  metrics: metrics,
                  deviceType: deviceType,
                  responsive: responsive,
                ),
              ),
            )
          ],
        ));
  }
}
