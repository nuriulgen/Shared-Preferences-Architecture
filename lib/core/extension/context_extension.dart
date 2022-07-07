import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // X: double = 10

  //PADDING
  EdgeInsets get paddingXVertical => const EdgeInsets.symmetric(vertical: 10);
  EdgeInsets get padding2xVertical => const EdgeInsets.symmetric(vertical: 20);
  EdgeInsets get paddingXHorizontal =>
      const EdgeInsets.symmetric(horizontal: 10);
  EdgeInsets get padding2xHorizontal =>
      const EdgeInsets.symmetric(horizontal: 20);
}
