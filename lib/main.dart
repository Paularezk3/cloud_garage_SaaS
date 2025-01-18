// Copyright (c) 2025 Paula Rezk and Zeyad Tamer
// Licensed under the MIT License with additional terms. See LICENSE file for details.

// lib/main.dart

import 'package:cloud_garage/config/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'config/locale_service.dart';
import 'config/setup_dependencies.dart';
import 'config/theme.dart';
import 'core/utils/responsive.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize dependencies
  setupDependencies();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocaleService _localeService = LocaleService();
  Locale? _deviceLocale;

  @override
  void initState() {
    super.initState();
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    final locale =
        await _localeService.getDeviceLocale(AppConfig.supportedLocales);
    setState(() {
      _deviceLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          // Initialize ScreenUtil
          Responsive.init(context);

          return MaterialApp.router(
            routerConfig: AppRouter.router,
            title: 'ERP SaaS for SME Car Service Centers',
            theme: AppTheme.lightTheme,
            localizationsDelegates: AppConfig.localizationDelegates,
            supportedLocales: AppConfig.supportedLocales,
            locale: _deviceLocale,
            localeResolutionCallback: AppConfig.resolveLocale,

            // home: const HomePage(),
          );
        });
      }),
    );
  }
}
