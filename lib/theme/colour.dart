import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xFF2A83DB);
  // static Color primaryAccent = const Color(0xFFDF78EF);
  // static Color primaryDark = const Color(0xFF790E8B);
  static Color cardColor = const Color(0xFFF6F1F1);
  static Color iconColor =  Colors.white;
  static Color dividerColor = const Color(0xFFE5E0E0);
  static Color testcolour = const Color(0xFFE5E0E0);
  static Color background = const Color(0xFF252525);
  static double opacity = .5;
  // note color
  static Color notepink = const Color(0xFFFC98FE).withOpacity(opacity);
  static Color noteco2 = const Color(0xFFFF9E9E).withOpacity(opacity);
  static Color noteco3 = const Color(0xFF90F38E).withOpacity(opacity);
  static Color noteco4 = const Color(0xFFFEF498).withOpacity(opacity);
  static Color noteco5 = const Color(0xFF9BFAFA).withOpacity(opacity);
  static Color noteco6 = const Color(0xFFB299FA).withOpacity(opacity);
  static List<Color> noteColorList = [
    notepink,
    noteco2,
    noteco3,
    noteco4,
    noteco5,
    noteco6
  ];
}
