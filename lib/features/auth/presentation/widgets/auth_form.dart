import 'package:cloud_garage/common/components/default_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/components/app_buttons.dart';
import '../../../../common/components/default_text_field.dart';
import '../../../../common/components/icon_container.dart';
import '../../../../config/setup_dependencies.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/responsive.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.responsive,
  });

  final IResponsive responsive;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.width(24)),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9), // Semi-transparent white
          borderRadius: BorderRadius.circular(16),
        ),
        width: responsive.width(400),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: responsive.height(24),
              ),
              // Icon Container
              const IconContainer(
                icon: Icons.login,
              ),
              SizedBox(height: responsive.height(16)),
              // Title
              DefaultText(
                'Sign In',
                responsive: responsive,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontColor: AppColors.textPrimary,
              ),
              const SizedBox(height: 8),
              // Subtitle
              DefaultText(
                "If you don't have an email, please contact the super admin.",
                textAlign: TextAlign.center,
                responsive: responsive,
                fontSize: responsive.fontSize(14),
                fontColor: AppColors.textPrimary,
              ),
              SizedBox(height: responsive.height(24)),
              // Email TextField
              const DefaultTextField(
                hintText: 'Enter your email',
                icon: Icons.email,
              ),
              SizedBox(height: responsive.height(16)),
              // Password TextField
              const DefaultTextField.password(
                hintText: 'Enter your password',
                // icon: Icons.password,
              ),
              SizedBox(height: responsive.height(8)),
              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const DefaultText(
                    'Forget password?',
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.textPrimary,
                  ),
                ),
              ),
              SizedBox(height: responsive.height(24)),
              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  padding: EdgeInsets.all(0),
                  // responsive: getIt<IResponsive>(),
                  logger: getIt<ILogger>(),
                  text: 'Get Started',
                  onPressed: () {
                    // Handle sign-in logic here
                    context.go("/dashboard");
                  },
                ),
              ),
              SizedBox(
                height: responsive.height(24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
