import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required BuildContext context,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.maxLines,
    this.isNumber = false,
    this.isLast = false,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final int? maxLines;
  final bool isNumber;

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizePresets.of(context).customHeight(150, context),
          horizontal: SizePresets.of(context).customWidth(50, context)),
      child: TextFormField(
        style:Theme.of(context).textTheme.bodyMedium ,
        keyboardType: isNumber == true ? TextInputType.number : null,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onSaved: (value) => controller.text = value!,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
    ;
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required BuildContext context,
    required this.onSubmitted,
    required this.hintText,
    this.icon,
    required this.controller,
    this.isNumber = false,
  });

  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final bool isNumber;
  final Function(String? value) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: controller,
      keyboardType: isNumber == true ? TextInputType.number : null,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.done,
      decoration: icon == null
          ? InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall)
          : InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              prefixIcon: Icon(
                icon,
                size: 20,
              ),
            ),
    );
  }
}
