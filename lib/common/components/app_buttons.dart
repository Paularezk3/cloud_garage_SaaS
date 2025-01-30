import 'package:cloud_garage/core/constants/strings.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ButtonSize { small, big }

mixin ButtonStyles {
  static TextStyle getTextStyle({
    required String text,
    required bool isEnabled,
    required ThemeData theme,
    required ButtonSize buttonSize,
    required bool isPrimary,
  }) {
    final isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(text);
    return TextStyle(
      fontSize: buttonSize == ButtonSize.big ? 18 : 14,
      fontWeight: FontWeight.bold,
      color: isPrimary
          ? Colors.white
          : (isEnabled ? AppColors.primaryPrimary : Colors.grey),
      fontFamily: Strings.fontFamilyName(isArabic),
    );
  }

  static BorderSide getBorderSide(
      {required bool isEnabled, required ThemeData theme, Color? borderColor}) {
    return BorderSide(
      color: isEnabled
          ? (borderColor ?? AppColors.primaryPrimary)
          : AppColors.primarySecondary,
      width: 2,
    );
  }

  static Size getButtonSize(ButtonSize size, {double? width, double? height}) {
    return Size(
      width ?? (size == ButtonSize.big ? 160 : 120),
      height ?? (size == ButtonSize.big ? 52 : 38),
    );
  }

  static Size getCircularLoadingSize(ButtonSize size) {
    return Size(
      size == ButtonSize.big ? 27 : 19,
      size == ButtonSize.big ? 27 : 19,
    );
  }

  static VoidCallback? onPressed(VoidCallback? onPressed, ILogger? logger) {
    return onPressed != null
        ? () {
            if (logger != null) {
              logger.trace("Button Pressed");
            }
            onPressed();
          }
        : () {
            if (logger != null) {
              logger.error("onPressed is $onPressed", StackTrace.empty);
            }
          };
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  final ButtonSize buttonSize;
  final EdgeInsets? padding;
  final ILogger logger;
  final IconData? icon; // Add an optional icon field

  const PrimaryButton({
    required this.text,
    required this.logger,
    this.isEnabled = true,
    this.isLoading = false,
    this.onPressed,
    this.buttonSize = ButtonSize.big,
    this.padding,
    this.icon,
    super.key,
  });

  // Named constructor for creating a button with an icon
  const PrimaryButton.icon({
    required this.text,
    required this.icon,
    required this.logger,
    this.isEnabled = true,
    this.isLoading = false,
    this.onPressed,
    this.buttonSize = ButtonSize.big,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? const EdgeInsets.all(15),
      child: SizedBox.fromSize(
        size: ButtonStyles.getButtonSize(buttonSize),
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              ButtonStyles.getButtonSize(buttonSize),
            ),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              return (isEnabled && onPressed != null)
                  ? AppColors.primaryPrimary
                  : AppColors.primarySecondary;
            }),
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.white.withValues(alpha: 0.1);
              }
              return null;
            }),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            elevation: WidgetStateProperty.resolveWith(
                (states) => states.contains(WidgetState.pressed) ? 0 : 2),
          ),
          onPressed: isEnabled && !isLoading
              ? ButtonStyles.onPressed(onPressed, logger)
              : null,
          child: isLoading
              ? SizedBox.fromSize(
                  size: ButtonStyles.getCircularLoadingSize(buttonSize),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Icon(
                        icon,
                        color: Colors.white,
                        size: buttonSize == ButtonSize.big ? 20 : 16,
                      ),
                    if (icon != null) const SizedBox(width: 8), // Add spacing
                    Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: ButtonStyles.getTextStyle(
                        text: text,
                        isEnabled: (isEnabled && onPressed != null),
                        theme: theme,
                        buttonSize: buttonSize,
                        isPrimary: true,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class OutlinedPrimaryButton extends StatelessWidget {
  /// You can set it with null, if you will use "child"
  final String? text;
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  final ButtonSize buttonSize;
  final EdgeInsets? padding;
  final ILogger? logger;
  final double? width;
  final double? height;
  final Color? borderColor;

  /// * This should be filled if the text parameter is null
  final Widget? child;

  const OutlinedPrimaryButton({
    required this.text,
    this.logger,
    this.isEnabled = true,
    this.isLoading = false,
    this.onPressed,
    this.buttonSize = ButtonSize.big,
    this.padding,
    this.height,
    this.width,
    this.child,
    this.borderColor,
    super.key,
  }) : assert(text != null || child != null,
            'Either "text" or "child" must be provided, but both cannot be null.');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? const EdgeInsets.all(15),
      child: SizedBox.fromSize(
        size: ButtonStyles.getButtonSize(buttonSize,
            width: width, height: height),
        child: OutlinedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              ButtonStyles.getButtonSize(
                  buttonSize), // Set a size based on buttonSize
            ),
            side: WidgetStateProperty.resolveWith(
              (states) => ButtonStyles.getBorderSide(
                  isEnabled: (isEnabled && onPressed != null),
                  theme: theme,
                  borderColor: borderColor),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return AppColors.primaryPrimary.withValues(alpha: 0.1);
              }
              return null;
            }),
          ),
          onPressed: isEnabled && !isLoading
              ? ButtonStyles.onPressed(onPressed, logger)
              : null,
          child: isLoading
              ? SizedBox.fromSize(
                  size: ButtonStyles.getCircularLoadingSize(buttonSize),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : child ??
                  Text(
                    text!,
                    style: ButtonStyles.getTextStyle(
                      text: text!,
                      isEnabled: (isEnabled && onPressed != null),
                      theme: theme,
                      buttonSize: buttonSize,
                      isPrimary: false,
                    ),
                  ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  /// You can set it with null, if you will use "child"
  final String? text;
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  final ButtonSize buttonSize;
  final EdgeInsets? padding;
  final ILogger? logger;

  /// * This should be filled if the text parameter is null
  final Widget? child;
  const SecondaryButton({
    required this.text,
    this.logger,
    this.child,
    this.isEnabled = true,
    this.isLoading = false,
    this.onPressed,
    this.buttonSize = ButtonSize.big,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isArabic =
        (AppLocalizations.of(context)?.localeName ?? "ar") == "ar";
    final textStyle = TextStyle(
      fontSize: buttonSize == ButtonSize.big ? 18 : 14,
      overflow: TextOverflow.fade,
      fontWeight: FontWeight.bold,
      color: (isEnabled && onPressed != null)
          ? AppColors.primaryPrimary
          : Colors.grey,
      fontFamily: Strings.fontFamilyName(isArabic),
    );
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: padding ?? const EdgeInsets.all(15),
      child: SizedBox.fromSize(
        size: ButtonStyles.getButtonSize(buttonSize),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize:
                ButtonStyles.getButtonSize(buttonSize), // Added minimumSize
            backgroundColor: (isEnabled && onPressed != null)
                ? (isDarkMode ? Colors.black87 : Colors.white)
                : AppColors.primarySecondary,
            disabledBackgroundColor: AppColors.primarySecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isEnabled && !isLoading
              ? ButtonStyles.onPressed(onPressed, logger)
              : null,
          child: isLoading
              ? SizedBox.fromSize(
                  size: ButtonStyles.getCircularLoadingSize(buttonSize),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      (isEnabled && onPressed != null)
                          ? AppColors.primaryPrimary
                          : Colors.white,
                    ),
                  ),
                )
              : (child ??
                  Text(
                    text!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: textStyle,
                  )),
        ),
      ),
    );
  }
}
