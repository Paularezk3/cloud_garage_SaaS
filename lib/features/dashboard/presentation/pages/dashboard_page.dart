import 'package:cloud_garage/config/setup_dependencies.dart';
import 'package:cloud_garage/core/constants/app_colors.dart';
import 'package:cloud_garage/core/utils/device_utils.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
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
    final navigationBarItems = [
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
        body: Stack(
          children: [
            Positioned(
                width: navigationWidth - 20,
                child: CustomNavigationBar(
                    responsive: responsive,
                    navigationBarItems: navigationBarItems)),
            Positioned(
                left: navigationWidth,
                width: MediaQuery.of(context).size.width - navigationWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        color: Colors.blueGrey.withValues(alpha: 0.2),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: DashboardBody(),
                ))
          ],
        ));
  }
}
