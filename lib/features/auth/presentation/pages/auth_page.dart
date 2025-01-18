import 'package:cloud_garage/config/setup_dependencies.dart';
import 'package:cloud_garage/core/constants/assets_path.dart';
import 'package:cloud_garage/core/utils/device_utils.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:cloud_garage/features/auth/presentation/widgets/build_photo.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final IResponsive responsive = getIt<IResponsive>();
    final IDeviceUtils deviceUtils = getIt<IDeviceUtils>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: deviceUtils.getDeviceType(context) != DeviceType.desktop
          ? _mobileAndTablet(responsive)
          : _desktop(responsive, context),
    );
  }

  Widget _desktop(IResponsive responsive, BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // Adjust positioning to make it 100px below and to the right of the screen
          height: MediaQuery.of(context).size.height * 1.3,
          width: MediaQuery.of(context).size.width * 1.3,
          bottom: -100, // Moves the image 100px below the screen
          right: -300, // Moves the image 100px to the right of the screen
          child: Image.asset(
            AssetsPath.sideWaveShape,
            fit:
                BoxFit.cover, // Ensure the image does not scale down improperly
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsive.height(8),
                  horizontal: responsive.width(8),
                ),
                child: AuthForm(responsive: responsive),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.width(16),
                  vertical: responsive.height(16),
                ),
                height: MediaQuery.of(context).size.height * 0.9,
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(25),
                  child: BuildPhoto(isMobile: false),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Stack _mobileAndTablet(IResponsive responsive) {
    return Stack(
      children: [
        BuildPhoto(
          isMobile: true,
        ),
        // Centered Container
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: responsive.height(8), horizontal: responsive.width(8)),
          child: AuthForm(responsive: responsive),
        ),
      ],
    );
  }
}
