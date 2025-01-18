// lib/core/di/setup_dependencies.dart
import 'package:cloud_garage/core/utils/device_utils.dart';
import 'package:cloud_garage/core/utils/logger.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Register LocaleService as a singleton
  getIt.registerLazySingleton<IDeviceUtils>(() => DeviceUtils());
  getIt.registerLazySingleton<IResponsive>(() => Responsive());
  getIt.registerLazySingleton<ILogger>(() => AppLogger());
}
