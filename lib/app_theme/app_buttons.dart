import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/app_theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {this.heightDiv,
      this.iconColor,
      this.widthDiv,
      required this.iconData,
      this.bgColor,
      required this.onPressed,
      Key? key})
      : super(key: key);
  final double? heightDiv;

  final double? widthDiv;

  final HexColor? bgColor;
  final void Function()? onPressed;
  final HexColor? iconColor;

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightDiv == null
          ? null
          : SizePresets.of(context).customHeight(heightDiv!, context),
      width: SizePresets.of(context).customHeight(widthDiv ?? 1, context),
      color: bgColor ?? AppColors.mainColor,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: iconColor ?? AppColors.backgroundColor,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton(
      {this.heightDiv,
      this.widthDiv,
      this.bgColor,
      this.textColor,
      required this.text,
      required this.onPressed,
      Key? key})
      : super(key: key);
  final double? heightDiv;

  final double? widthDiv;
  final String text;

  final HexColor? bgColor;
  final HexColor? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: bgColor ?? AppColors.mainColor,
          gradient:
              LinearGradient(colors: [AppColors.mainColor, HexColor("B20CD9")]),
        ),
        height: heightDiv == null
            ? null
            : SizePresets.of(context).customHeight(heightDiv!,context),
        width: SizePresets.of(context).customHeight(widthDiv ?? 1,context),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalText(
                color: textColor ?? AppColors.backgroundColor),
          ),
        ));
  }
}
