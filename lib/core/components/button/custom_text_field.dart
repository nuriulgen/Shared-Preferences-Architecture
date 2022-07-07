import 'package:flutter/material.dart';

import '../../../product/color/color_items.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, this.hintText, this.suffixIcon, this.prefixIcon})
      : super(key: key);

  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    ColorItems colorItems = ColorItems();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: colorItems.inputBackgroundColor,
        hintText: hintText,
        hintStyle: TextStyle(
          color: colorItems.inputColor,
          fontSize: 16,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: FormFieldValidator.isNotEmpty,
    );
  }
}

class FormFieldValidator {
  static String? isNotEmpty(String? value) {
    return (value?.isNotEmpty ?? false) ? null : ValidatorMessage().isNotEmpty;
  }
}

class ValidatorMessage {
  final String isNotEmpty = 'Bu alan boş bırakılmaz';
}
