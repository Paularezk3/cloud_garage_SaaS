// Copyright (c) 2025 Paula Rezk and Zeyad Tamer
// Licensed under the MIT License with additional terms. See LICENSE file for details.

// lib/main.dart

import 'package:flutter/material.dart';
import 'config/setup_dependencies.dart';
import 'core/constants/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  setupDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERP SaaS for SME Car Service Centers',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Center(child: Text('ERP SaaS for SME Car Service Centers')),
      ),
    );
  }
}
