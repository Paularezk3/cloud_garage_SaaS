// lib\core\utils\device_utils.dart

import 'dart:io';

import 'package:flutter/widgets.dart';

/// Enum to represent the type of device.
enum DeviceType { mobile, tablet, desktop }

abstract class IDeviceUtils {
  DeviceType getDeviceType(BuildContext context);
  bool get isAndroid;
  bool get isIOS;
  bool get isWindows;
  String getPlatformName();
}

class DeviceUtils implements IDeviceUtils {
  @override
  DeviceType getDeviceType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width >= 1024) return DeviceType.desktop;
    if (width >= 700) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  @override
  bool get isAndroid => Platform.isAndroid;

  @override
  bool get isIOS => Platform.isIOS;

  @override
  bool get isWindows => Platform.isWindows;

  @override
  String getPlatformName() {
    if (isAndroid) return 'Android';
    if (isIOS) return 'iOS';
    if (isWindows) return 'Windows';
    return 'Unknown';
  }
}
