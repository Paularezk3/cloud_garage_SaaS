import 'package:cloud_garage/core/constants/app_colors.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  /// if fontSize is given, it must be given also
  final IResponsive? responsive;
  final Color? fontColor;
  final TextAlign? textAlign;
  const DefaultText(this.text,
      {this.responsive,
      this.textAlign,
      this.fontColor,
      this.fontWeight,
      this.fontSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the font based on the locale
    final locale = AppLocalizations.of(context)?.localeName ?? 'ar';
    final fontFamily = locale == 'ar' ? 'IBMPlexSansArabic' : 'TTHovesPro';
    if (responsive == null && fontSize != null) {
      throw Exception(
          "responsive is expected, responsive == null && fontSize != null");
    }
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: fontColor ?? AppColors.textPrimary,
          fontSize: fontSize != null ? responsive!.fontSize(fontSize!) : null,
          fontFamily: fontFamily,
          fontWeight: fontWeight),
    );
  }
}
