import 'package:flutter/material.dart';

class AppTextForm {
  static getTextFormField({
    required BuildContext context,
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
    int? maxLines,
    bool isNumber = false,
    bool isLast = false,
  }) =>
      TextFormField(
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
      );

  static getTextField(
          {required String hintText,
            required BuildContext context,
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
          onSubmitted: onSubmitted,
          textInputAction: TextInputAction.done,
          decoration: icon == null
              ? InputDecoration(
                  hintText: hintText, hintStyle: Theme.of(context).textTheme.bodySmall)
              : InputDecoration(
                  hintText: hintText,
                  hintStyle:Theme.of(context).textTheme.bodySmall,
                  prefixIcon: Icon(
                    icon,
                    size: 20,
                  ),
                ),
        ),
      );
}
