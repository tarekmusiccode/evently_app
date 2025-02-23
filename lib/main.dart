import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState>navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      navigatorKey: navigatorKey,
    );
  }
}