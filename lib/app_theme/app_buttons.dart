import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'app_colors.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.context,
    this.color,
  });

  final String text;
  final BuildContext context;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          border: Border.all(color: color ?? AppColors.mainColor)),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {this.iconColor,
      required this.iconData,
      this.bgColor,
      required this.onPressed,
      Key? key})
      : super(key: key);

  final Color? bgColor;
  final void Function()? onPressed;
  final HexColor? iconColor;

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(40.0),
          ),
          border: Border.all(color: bgColor ?? AppColors.mainColor)),
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
            : SizePresets.of(context).customHeight(heightDiv!, context),
        width: SizePresets.of(context).customHeight(widthDiv ?? 1, context),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ));
  }
}

class AppButtonWithIcon extends StatelessWidget {
  const AppButtonWithIcon(
      {super.key,
      required this.context,
      this.width,
      this.height,
      required this.icon,
      required this.color,
      this.onPressed,
      required this.text});

  final BuildContext context;
  final double? width;
  final double? height;
  final IconData icon;
  final Color color;

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            color: AppColors.backgroundColor,
            border: Border.all(color: color.withOpacity(0.5))),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 28,
                color: color,
              ),
              SizedBox(width: SizePresets.of(context).customWidth(30, context),),
              Text(text, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ));
  }
}
