import 'package:flutter/material.dart';

import '../../../product/color/color_items.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.color})
      : super(key: key);
  ColorItems colorItems = ColorItems();
  final String title;
  final Color color;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: colorItems.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
