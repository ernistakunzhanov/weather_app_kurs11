import 'package:flutter/material.dart';

class AppDecoration {
  static const BoxDecoration screenDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/weather.jpg'),
      fit: BoxFit.cover,
    ),
  );
  static BoxDecoration buttonDecor = BoxDecoration(
    // color: Colors.greenAccent,
    borderRadius: BorderRadius.circular(12),
  );
}
