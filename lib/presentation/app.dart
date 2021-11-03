import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/logic/cubits/authentication_cubit.dart';

import '../core/constants/localization.dart';
import '../core/constants/routes.dart';
import '../core/themes/app_theme.dart';
import 'router/router_imports.dart';

class GalleryApp extends StatefulWidget {
  const GalleryApp({
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryApp> createState() => _GalleryAppState();
}

class _GalleryAppState extends State<GalleryApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalization.textGallery,
      theme: AppTheme.lightTheme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            switch (state) {
              case AuthenticationState.authenticated:
                _navigator.pushNamedAndRemoveUntil(
                  AppRoutes.start,
                  (route) => false,
                );
                break;
              case AuthenticationState.unauthenticated:
                _navigator.pushNamedAndRemoveUntil(
                  AppRoutes.welcome,
                  (route) => false,
                );
                break;
            }
          },
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
