import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/logic/cubits/sign_in_cubit.dart';
import 'package:gallery/logic/cubits/sign_up_cubit.dart';

import '../core/constants/localization.dart';
import '../core/constants/routes.dart';
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
      initialRoute: context.read<SignUpCubit>().state.value != null ||
              context.read<SignInCubit>().state.value != null
          ? AppRoutes.home
          : AppRoutes.welcome,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
