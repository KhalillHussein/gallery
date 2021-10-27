import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppStyles {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppStyles._();

  ///Primary text styles
  static const primaryTextStyleButton = TextStyle(
    color: AppColors.colorWhite,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  ///Basic text styles
  static const textStyleButton = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const textStyleS1 = TextStyle(
    color: AppColors.colorGray_2,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const textStyleH1 = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
  static const textStyleH2 = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );
  static const textStyleBodyText1 = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static const textStyleBodyText2 = TextStyle(
    color: AppColors.colorGray_1,
    fontSize: 14,
  );
  static const textStyleCaption = TextStyle(
    color: AppColors.colorGray_1,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}
