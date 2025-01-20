import 'package:cloud_garage/core/constants/strings.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultTextField extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final bool isPassword;

  const DefaultTextField({
    super.key,
    this.hintText,
    this.icon,
    this.controller,
    this.onChanged,
    this.obscureText = false,
  }) : isPassword = false;

  const DefaultTextField.password({
    super.key,
    this.hintText,
    this.icon = Icons.lock,
    this.controller,
    this.onChanged,
  })  : obscureText = true,
        isPassword = true;

  @override
  DefaultTextFieldState createState() => DefaultTextFieldState();
}

class DefaultTextFieldState extends State<DefaultTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);
    final primaryColor = AppColors.primaryPrimary;
    final bool withIcon = widget.icon != null;
    final isArabic = AppLocalizations.of(context)!.localeName == "ar";
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontFamily: Strings.fontFamilyName(isArabic)),
        prefixIcon: withIcon ? Icon(widget.icon, color: Colors.grey) : null,
        filled: withIcon,
        fillColor: withIcon ? AppColors.primarySecondary : null,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: withIcon ? Colors.transparent : AppColors.secondarySecondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: withIcon ? Colors.transparent : AppColors.secondarySecondary,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        // Add toggle icon for password
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _toggleObscureText,
              )
            : null,
      ),
    );
  }
}
