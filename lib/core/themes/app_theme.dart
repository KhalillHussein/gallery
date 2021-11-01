import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../constants/colors.dart';
import '../styles/styles.dart';

/// Class that contains all the different themes of an app
class AppTheme {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppTheme._();

  /// Custom page transitions
  static final _pageTransitionsTheme = PageTransitionsTheme(
    builders: const {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: AppColors.brightnessLight,
    primaryColor: AppColors.colorBlackGray,
    indicatorColor: AppColors.colorPink,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.colorGray_1,
    ),
    splashColor: AppColors.colorTransparent,
    splashFactory: InkRipple.splashFactory,
    hoverColor: AppColors.colorTransparent,
    highlightColor: AppColors.colorTransparent,
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.colorBlack,
      unselectedLabelColor: AppColors.colorGray_1,
      labelStyle: AppStyles.textStyleBodyText1,
      unselectedLabelStyle: AppStyles.textStyleBodyText2.copyWith(
        fontSize: 17,
      ),
    ),
    canvasColor: AppColors.colorGray_4,
    scaffoldBackgroundColor: AppColors.colorWhite,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.colorPink,
      primary: AppColors.colorBlackGray,
    ),
    dividerColor: AppColors.colorGray_1,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.colorWhite,
    ),
    pageTransitionsTheme: _pageTransitionsTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.colorBlue,
      selectionColor: AppColors.colorBlue,
      selectionHandleColor: AppColors.colorBlue,
    ),
    primaryTextTheme: TextTheme(
      button: AppStyles.primaryTextStyleButton,
    ),
    textTheme: TextTheme(
      button: AppStyles.textStyleButton,
      headline2: AppStyles.textStyleH2,
      headline1: AppStyles.textStyleH1,
      bodyText1: AppStyles.textStyleBodyText1,
      bodyText2: AppStyles.textStyleBodyText2,
      subtitle1: AppStyles.textStyleS1,
      caption: AppStyles.textStyleCaption,
    ),
  );

  static void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
