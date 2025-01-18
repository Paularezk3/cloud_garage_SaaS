import 'package:flutter/material.dart';

import 'overview_metrics.dart';
import 'quick_actions.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Overview Metrics Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OverviewMetrics(),
          ),
          // Quick Actions Section
          Padding(
            padding: EdgeInsets.all(16.0),
            child: QuickActions(),
          ),
        ],
      ),
    );
  }
}
