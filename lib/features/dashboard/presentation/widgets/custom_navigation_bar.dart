import 'package:cloud_garage/core/constants/assets_path.dart';
import 'package:cloud_garage/core/utils/device_utils.dart';
import 'package:flutter/material.dart';

import '../../../../common/components/default_text.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/navigation_bar_items.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.responsive,
    required this.isTablet,
    required this.isExtended,
    required this.navigationBarItems,
  });

  final IResponsive responsive;
  final bool isTablet;
  final bool isExtended;
  final List<NavigationBarItems> navigationBarItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Shrink-wrap the Column
      children: [
        SizedBox(
          height: responsive.height(15),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: Image.asset(AssetsPath.saasLogo64),
            ),
            if (!isTablet) ...[
              SizedBox(
                width: 12,
              ),
              DefaultText(
                "El-Khawaga",
                fontSize: 18,
                responsive: responsive,
                fontWeight: FontWeight.w600,
              )
            ]
          ],
        ),
        SizedBox(
          height: responsive.height(25),
        ),
        SizedBox(
          height: responsive.height(500),
          child: ListView(
            children: navigationBarItems
                .map(
                  (item) => InkWell(
                    enableFeedback: true,
                    onTap: () {},
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    splashColor:
                        Colors.black.withValues(alpha: 0.1), // Splash effect
                    highlightColor:
                        Colors.black.withValues(alpha: 0.05), // Hover effect
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: item.itemName == 'Dashboard'
                            ? AppColors.background
                            : null,
                        boxShadow: item.itemName == 'Dashboard'
                            ? [
                                BoxShadow(
                                  offset: const Offset(3, 3),
                                  color: Colors.blueGrey.withValues(alpha: 0.2),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 4,
                            color: item.itemName == 'Dashboard'
                                ? AppColors.primaryPrimary
                                : null,
                          ),
                          const SizedBox(width: 15),
                          Icon(
                            item.itemIcon,
                            color: item.itemName == 'Dashboard'
                                ? AppColors.primaryPrimary
                                : Colors.blueGrey,
                          ),
                          const SizedBox(width: 15),
                          DefaultText(
                            item.itemName,
                            fontWeight: FontWeight.w500,
                            fontColor: item.itemName == 'Dashboard'
                                ? AppColors.primaryPrimary
                                : Colors.blueGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
