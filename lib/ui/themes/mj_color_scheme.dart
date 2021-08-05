import 'package:flutter/material.dart';

import 'color_utils.dart';

/// Allow choosing colors for app theme
abstract class MjColorTheme {
  /// Standard Light Theme
  ColorScheme light() => ColorScheme(
        brightness: Brightness.light,
        primary: const Color(0xFFF0F0F0),
        primaryVariant: ColorUtil().darken(const Color(0xFFF0F0F0), 0.2),
        secondary: const Color(0xFFE1994C),
        secondaryVariant: const Color(0xFFd1893C),
        background: const Color(0xFFE4E4E3),
        surface: Colors.white,
        onBackground: const Color(0xFF0F0F0F),
        onSurface: const Color(0xFF0F0F0F),
        onError: const Color(0xFF0F0F0F),
        onPrimary: const Color(0xFF0F0F0F),
        onSecondary: const Color(0xFFf7f7f7),
        error: const Color(0xFFB71C1C),
      );

  /// Standard Light Theme
  ColorScheme dark() => ColorScheme(
        brightness: Brightness.dark,
        primary: const Color(0xFFF0F0F0),
        primaryVariant: ColorUtil().darken(const Color(0xFFF0F0F0), 0.2),
        secondary: const Color(0xFFd1893C),
        secondaryVariant: const Color(0xFFE1994C),
        background: const Color(0xFF292929),
        surface: const Color(0xff050505),
        onBackground: const Color(0xFFf7f7f7),
        onSurface: const Color(0xFFf7f7f7),
        onError: const Color(0xFFf7f7f7),
        onPrimary: const Color(0xFF0F0F0F),
        onSecondary: const Color(0xFF0F0F0F),
        error: const Color(0xFF984F46),
      );
}
