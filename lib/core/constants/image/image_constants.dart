import 'package:flutter/material.dart';

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.fitHeight);
  }

  String get _nameWithPath => 'assets/images/$name.png';
}
