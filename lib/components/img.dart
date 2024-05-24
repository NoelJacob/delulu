import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  final double height;

  const Img(
    this.height, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Uint8List image = base64.decode("encoded");
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: MemoryImage(image),
          fit: BoxFit.cover, // Ensures the image covers the container
        ),
      ),
    );
  }
}
