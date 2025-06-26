import 'package:flutter/material.dart';

class IshiharaImage extends StatelessWidget {
  const IshiharaImage({super.key});

  static const double size = 250.0;

  @override
  Widget build(BuildContext context) =>
      Image.asset('assets/ishihara.png', height: size, width: size);
}
