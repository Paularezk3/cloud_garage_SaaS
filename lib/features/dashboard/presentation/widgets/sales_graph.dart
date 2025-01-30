import 'package:cloud_garage/common/components/app_buttons.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../common/components/default_text.dart';
import '../../../../core/constants/app_colors.dart';

class SalesGraph extends StatefulWidget {
  final IResponsive responsive;
  const SalesGraph({required this.responsive, super.key});

  @override
  State<SalesGraph> createState() => _SalesGraphState();
}

class _SalesGraphState extends State<SalesGraph> {
  List<Color> gradientColors = [
    AppColors.secondaryPrimary,
    AppColors.primaryPrimary.withValues(alpha: 0.0),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      // margin: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
          OutlinedPrimaryButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            buttonSize: ButtonSize.small,
            isEnabled: true,
            text: null,
            // Todo: Add Logger Here from the given parameters
            // logger: logger,
            borderColor: showAvg
                ? AppColors.primaryPrimary.withValues(alpha: 0.5)
                : AppColors.primaryPrimary,
            child: DefaultText(
              showAvg ? "Hide Average" : 'Show Average',
              fontSize: 12,
              responsive: widget.responsive,
              fontWeight: FontWeight.bold,
              fontColor: showAvg
                  ? AppColors.primaryPrimary.withValues(alpha: 0.5)
                  : AppColors.primaryPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = DefaultText(
          'MAR',
          responsive: widget.responsive,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        );
        break;
      case 5:
        text = DefaultText(
          'JUN',
          responsive: widget.responsive,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        );
        break;
      case 8:
        text = DefaultText(
          'SEP',
          responsive: widget.responsive,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        );
        break;
      case 11:
        text = DefaultText(
          'Dec',
          responsive: widget.responsive,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        );
        break;
      default:
        text = DefaultText(
          '',
          responsive: widget.responsive,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        );
        break;
    }

    return SideTitleWidget(
      meta: meta,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return DefaultText(text,
        responsive: widget.responsive,
        fontWeight: FontWeight.bold,
        fontSize: 15,
        textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.primaryPrimaryLight,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.primaryPrimaryLight,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          // TODO: Make "spots" taken from a given parameter
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withValues(alpha: 0.3))
                    .toList(),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.primaryPrimaryLight,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.primaryPrimaryLight,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          // TODO: make spots taken from a given parameter
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(colors: [
              AppColors.primaryPrimary,
              AppColors.primaryPrimary.withValues(alpha: 0.0)
              // ColorTween(begin: gradientColors[0], end: gradientColors[1])
              //     .lerp(0.2)!
              //     .withValues(alpha: 0.1),
              // ColorTween(begin: gradientColors[0], end: gradientColors[1])
              //     .lerp(0.2)!
              //     .withValues(alpha: 0.1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
      ],
    );
  }
}
