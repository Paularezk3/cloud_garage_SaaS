// lib/core/utils/responsive.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class IResponsive {
  double width(double value);
  double height(double value);
  double fontSize(double value);
}

class Responsive implements IResponsive {
  const Responsive();

  static void init(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }

  @override
  double width(double value) => value.w;

  @override
  double height(double value) => value.h;

  @override
  double fontSize(double value) => value.sp;
}
