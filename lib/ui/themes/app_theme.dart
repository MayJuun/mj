import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mj/ui/themes/mj_color_scheme.dart';
import 'package:mj/ui/themes/mj_text_theme.dart';

import 'color_utils.dart';

/// Helper class for creating consistent app themes
class AppTheme {
  /// Primary Constructor
  AppTheme({
    this.defaultTheme = ThemeMode.light,
    required this.primaryColor,
    required this.primaryVariant,
    this.txt,
    this.accentTxt,
  });

  /// fromType factory constructor
  factory AppTheme.fromType({ThemeMode? themeMode, Color? primaryColor}) {
    return AppTheme(
      defaultTheme: themeMode,
      primaryColor: primaryColor ?? const Color(0xFFF0F0F0),
      primaryVariant: ColorUtil().darken(
        primaryColor ?? const Color(0xFFF0F0F0),
        0.2,
      ),
      txt: themeMode == ThemeMode.light
          ? const Color(0xFF0F0F0F)
          : const Color(0xFFf7f7f7),
      accentTxt: themeMode == ThemeMode.light
          ? const Color(0xFFf7f7f7)
          : const Color(0xFF0F0F0F),
    );
  }

  /// Primary color can be specified by calling app
  final Color primaryColor;

  /// Primary color can be specified by calling app
  final Color primaryVariant;

  /// Primary text color
  late final Color? txt;

  /// Accent text color
  late final Color? accentTxt;

  /// Default is light mode
  final ThemeMode? defaultTheme;

  /// The color grey (not me)
  static const Color grey = Color(0xFF757575);

  /// Quick check if light or dark mode
  bool get isDark => defaultTheme == ThemeMode.dark;

  ThemeData get themeData {
    return ThemeData.from(
            textTheme: MjTextTheme.standard(),
            colorScheme: defaultTheme == ThemeMode.light
                ? MjColorTheme.light(primaryColor: primaryColor)
                : MjColorTheme.dark(primaryColor: primaryColor))
        .copyWith(
            appBarTheme: AppBarTheme(
                systemOverlayStyle: isDark
                    ? SystemUiOverlayStyle.dark
                    : SystemUiOverlayStyle.light),
            brightness: isDark ? Brightness.dark : Brightness.light,
            typography: Typography.material2018(),
            accentTextTheme: MjTextTheme.standard().apply(bodyColor: accentTxt),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: primaryColor,
              selectionColor: grey,
              selectionHandleColor: Colors.transparent,
            ),
            iconTheme: const IconThemeData(color: grey, size: 30),
            buttonColor: primaryColor,
            // this theme currently used for HomeButtonNav only
            // if other TextButtons are used, it will need to be extracted
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    const CircleBorder()),
                foregroundColor: MaterialStateProperty.all<Color>(txt!),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return grey.withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return grey.withOpacity(0.12);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: primaryColor,
              foregroundColor: isDark ? accentTxt : txt,
            ),
            highlightColor: primaryVariant,
            toggleableActiveColor: primaryVariant);
  }
}
