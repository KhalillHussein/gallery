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

  // static final CupertinoThemeData lightTheme = CupertinoThemeData(
  //   brightness: AppColors.brightnessLight,
  //   primaryColor: AppColors.colorBlackGray,
  //   scaffoldBackgroundColor: AppColors.colorWhite,
  //   textTheme: CupertinoTextThemeData(
  //     button: const TextStyle(
  //         color: AppColors.colorBlack,
  //         fontSize: 14,
  //         fontWeight: FontWeight.w700),
  //     headline2: const TextStyle(
  //         color: AppColors.colorBlack,
  //         fontSize: 25,
  //         fontWeight: FontWeight.w700),
  //     headline1: const TextStyle(
  //         color: AppColors.colorBlack,
  //         fontSize: 30,
  //         fontWeight: FontWeight.w700),
  //     bodyText1: const TextStyle(
  //         color: AppColors.colorBlack,
  //         fontSize: 17,
  //         fontWeight: FontWeight.w400),
  //     bodyText2: TextStyle(color: AppColors.colorGray, fontSize: 14),
  //   ),
  // );

  static void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}


// class AppThemeData {
//   static final ThemeData darkTheme = ThemeData(
//     brightness: AppColors.brightnessDark,
//     bottomSheetTheme: BottomSheetThemeData(
//       backgroundColor: AppColors.colorBlackGray,
//     ),
//     textSelectionTheme: TextSelectionThemeData(
//       selectionColor: AppColors.colorVeryLightGreen.withOpacity(0.5),
//       selectionHandleColor: AppColors.colorVeryLightGreen,
//     ),
//     textTheme: TextTheme(
//       button: const TextStyle(color: AppColors.colorWhite, fontSize: 18),
//       headline4: const TextStyle(color: AppColors.colorWhite),
//       headline3: const TextStyle(color: AppColors.colorWhite, fontSize: 18, fontWeight: FontWeight.w400),
//       headline2: const TextStyle(color: AppColors.colorWhite, fontSize: 22, fontWeight: FontWeight.w400),
//       headline1: const TextStyle(color: AppColors.colorWhite, fontSize: 24, fontWeight: FontWeight.w400),
//       bodyText1: const TextStyle(color: AppColors.colorWhite, fontSize: 16, fontWeight: FontWeight.w400),
//       bodyText2: TextStyle(color: AppColors.colorWhite.withOpacity(0.6), fontSize: 14),
//     ),
//     appBarTheme: const AppBarTheme(
//       brightness: AppColors.brightnessDark,
//       color: AppColors.colorBlackGray,
//       iconTheme: const IconThemeData(
//         color: AppColors.colorWhite,
//       ),
//     ),
//     cardTheme: CardTheme(
//       color: AppColors.colorGray_3,
//       shadowColor: AppColors.colorBlack,
//       clipBehavior: Clip.hardEdge,
//       margin: const EdgeInsets.only(top: 8.0, right: 10.0, left: 10.0),
//     ),
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       backgroundColor: AppColors.colorLightGreen,
//       foregroundColor: AppColors.colorWhite.withOpacity(0.3),
//     ),
//     iconTheme: const IconThemeData(
//       color: AppColors.colorWhite,
//     ),
//     buttonColor: AppColors.colorLightGreen,
//     primarySwatch: AppColors.colorLightGreen,
//     accentColor: AppColors.colorLightGreen,
//     primaryColor: AppColors.colorBlackGray,
//     scaffoldBackgroundColor: AppColors.colorMediumGray,
//     cardColor: AppColors.colorGray_3,
//     dividerColor: AppColors.colorWhite,
//   );
// }