import 'package:flutter/material.dart';

enum BrandColors { BlackGrey, DarkBlue }

class BrandColor {
  static Color getColor(BrandColors color) {
    switch (color) {
      case BrandColors.BlackGrey:
        return Colors.grey.shade800;
        break;
      case BrandColors.DarkBlue:
        // return Color.fromARGB(1, 45, 50, 79);
        return Color.fromRGBO(45, 50, 79, 1);
        break;
    }
    return null;
  }
}
