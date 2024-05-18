import 'package:flutter/material.dart';

/// 画像を表示するWidget
class Photo extends StatelessWidget {
  const Photo({
    super.key,
    required this.url,
    required this.height,
  });

  final String url;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
    );
  }
}