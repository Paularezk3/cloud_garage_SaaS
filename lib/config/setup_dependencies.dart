// lib/core/di/setup_dependencies.dart
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupDependencies() {
  // Register Repositories
  // locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  // Register Use Cases
  // locator.registerLazySingleton(() => GetUser(locator()));

  // Register Other Services (Example: Network Service)
  // locator.registerLazySingleton<NetworkService>(() => DioNetworkService());
}
