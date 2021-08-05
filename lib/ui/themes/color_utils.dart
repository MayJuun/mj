import 'package:flutter/material.dart';

/// spec: https://stackoverflow.com/questions/58360989/programmatically-lighten-or-darken-a-hex-color-in-dart
/// Class is used to change colors of themes
class ColorUtil {
  // amount range from 0.0 to 1.0

  /// Used to darken colors
  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final HSLColor hsl = HSLColor.fromColor(color);
    final HSLColor hslDark =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  /// Used to lighten colors
  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final HSLColor hsl = HSLColor.fromColor(color);
    final HSLColor hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  /// Used to lighten or darken colors based on the mode
  Color lightenOrDarken(Color color, Brightness brightness,
      [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    // when in light mode, things get darker
    // reverse happens if dark mode
    return brightness == Brightness.light
        ? darken(color, amount)
        : lighten(color, amount);
  }

  /// the primary color scheme is always designed with a lighter color
  /// this utility class will modify this separately based on current brightness
  Color darkenedPrimaryText(Color color, Brightness brightness) {
    return (brightness == Brightness.dark)
        ? darken(color, 0.1)
        : darken(color, 0.4);
  }
}
