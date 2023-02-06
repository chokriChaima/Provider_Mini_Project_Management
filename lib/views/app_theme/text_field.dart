import 'package:first_week_demo/views/app_theme/text_style.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTextForm {
  static getTextFormField({
    required String hintText,
    IconData? icon,
    required TextEditingController controller,
    int? maxLines,
    bool isNumber = false,
    bool isLast = false,
  }) =>
      Material(
        elevation: 13.0,
        shadowColor: Colors.white,
        child: TextFormField(
          keyboardType: isNumber == true ? TextInputType.number : null,
          controller: controller,
          onSaved: (value) => controller.text = value!,
          textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
          decoration: icon == null
              ? InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTextStyle.thinText(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.backgroundColor,
                  )))
              : InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTextStyle.thinText(),
                  prefixIcon: Icon(
                    icon,
                    size: 20,
                  ),
                ),
        ),
      );

  static getTextField(
          {required String hintText,
          IconData? icon,
          bool isNumber = false,
          required TextEditingController controller,
          int? maxLines,
          required Function(String? value) onSubmitted}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextField(
          autofocus: false,
          controller: controller,
          keyboardType: isNumber == true ? TextInputType.number : null,
          onSubmitted : onSubmitted,
          textInputAction: TextInputAction.done,
          decoration: icon == null
              ? InputDecoration(
                  hintText: hintText, hintStyle: AppTextStyle.thinText())
              : InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTextStyle.thinText(),
                  prefixIcon: Icon(
                    icon,
                    size: 20,
                  ),
                ),
        ),
      );
}
