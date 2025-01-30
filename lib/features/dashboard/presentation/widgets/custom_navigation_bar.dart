import 'package:cloud_garage/core/constants/assets_path.dart';
import 'package:flutter/material.dart';

import '../../../../common/components/default_text.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/navigation_bar_items.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.responsive,
    required this.isTablet,
    required this.isExtended,
    required this.navigationBarItems,
    required this.onExpandedToggle,
  });

  final IResponsive responsive;
  final bool isTablet;
  final bool isExtended;
  final List<NavigationBarItems> navigationBarItems;
  final void Function() onExpandedToggle;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool isExpanded = true; // Track whether the side nav is expanded or collapsed

  @override
  Widget build(BuildContext context) {
    final listHeight = 50.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: widget.responsive.height(15),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: Image.asset(widget.isTablet
                  ? AssetsPath.saasLogo256
                  : AssetsPath.saasLogo64),
            ),
            if (!widget.isTablet && isExpanded) ...[
              SizedBox(
                width: 12,
              ),
              DefaultText(
                "El-Khawaga",
                fontSize: 18,
                responsive: widget.responsive,
                fontWeight: FontWeight.w600,
              )
            ]
          ],
        ),
        SizedBox(
          height: widget.responsive.height(25),
        ),
        Expanded(
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: widget.navigationBarItems
                .map(
                  (item) => Container(
                    margin: EdgeInsets.only(
                        right: 20,
                        bottom: item.itemName == 'Dashboard'
                            ? 8
                            : 0), // to make the chosen item have some bottom space
                    child: InkWell(
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
                                    color:
                                        Colors.blueGrey.withValues(alpha: 0.2),
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
                              height: listHeight,
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
                            if (isExpanded)
                              Expanded(
                                child: DefaultText(
                                  item.itemName,
                                  fontWeight: FontWeight.w500,
                                  fontColor: item.itemName == 'Dashboard'
                                      ? AppColors.primaryPrimary
                                      : Colors.blueGrey,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        IconButton(
          icon: Icon(
            isExpanded ? Icons.arrow_back : Icons.arrow_forward,
            size: 24,
          ),
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded; // Toggle the state
              widget.onExpandedToggle();
            });
          },
          tooltip:
              isExpanded ? 'Collapse Navigation Bar' : 'Expand Navigation Bar',
        )
      ],
    );
  }
}
