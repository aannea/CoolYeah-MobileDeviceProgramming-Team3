import 'package:flutter/material.dart';

class HexToColor {
  hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor += "FF";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
