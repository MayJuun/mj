import 'package:flutter/material.dart';

/// This is a class for specifying the text theme that's going to be used
/// in your app
abstract class MjTextTheme {
  static TextStyle _style(double s, FontWeight w) =>
      TextStyle(fontSize: s, fontWeight: w);

  /// This is the first and generic theme that we have available
  static TextTheme standard() => TextTheme(
        headline1: _style(96.0, FontWeight.normal),
        headline2: _style(60.0, FontWeight.bold),
        headline3: _style(48.0, FontWeight.normal),
        headline4: _style(36.0, FontWeight.bold),
        headline5: _style(22.0, FontWeight.w500),
        headline6: _style(18.0, FontWeight.w500),
        bodyText1: _style(18.0, FontWeight.normal),
        bodyText2: _style(16.0, FontWeight.normal),
        subtitle1: _style(16.0, FontWeight.normal),
        subtitle2: _style(14.0, FontWeight.normal),
        button: _style(18.0, FontWeight.normal),
        caption: _style(12.0, FontWeight.normal),
        overline: _style(16.0, FontWeight.normal),
      ).apply(fontFamily: 'Lato');
}
