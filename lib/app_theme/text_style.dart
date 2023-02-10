
import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTextStyle {
  static  TextStyle title({Color? color}) => TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w400,
    fontSize: 64,
    letterSpacing: 0.4,
    height: 0.9,
    color: color??AppColors.darkColor,
  );

  static  TextStyle thinText({Color? color,double? size}) => TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w300,
    fontSize: size??17,
    letterSpacing: 0.1, height: 0.9,
    color: color??AppColors.darkColor,
  );

  static  TextStyle boldText({Color? color,double? size}) => TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.bold,
    fontSize: size??22,
    letterSpacing: 0.1,
    height: 0.9,
    color: color??AppColors.darkColor,
  );



  static TextStyle normalText({Color? color,double? size}) => TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.normal,
    fontSize: size??22,
    letterSpacing: 0.2,
    height: 0.9,
    color: color?? AppColors.darkColor,
  );
}