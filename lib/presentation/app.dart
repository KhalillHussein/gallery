import 'package:flutter/material.dart';
import 'package:gallery/core/constants/localization.dart';
import 'package:gallery/core/constants/routes.dart';
import '../core/themes/app_theme.dart';
import 'router/router_imports.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalization.textGallery,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcome,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
