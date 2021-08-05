// import 'package:flutter/material.dart';

// class AppTheme {
//   AppTheme({this.primaryColor});

//   /// fromType factory constructor
//   factory AppTheme.fromType(
//       {required ThemeType themeType, Color? primaryColor}) {
//     final Color primaryColorVariant =
//         ColorUtil().darken(primaryColor ?? _AppColors.primary, 0.2);
//     switch (themeType) {
//       case ThemeType.LightMode:
//         return AppTheme(primaryColor: primaryColor)
//           ..isDark = false
//           ..bg = _AppColors.greySurface
//           ..surface = Colors.white
//           ..primary = primaryColor ?? _AppColors.primary
//           ..primaryVariant = primaryColorVariant
//           ..secondary = _AppColors.accent
//           ..secondaryVariant = _AppColors.accentDark
//           ..grey = _AppColors.grey
//           ..error = _AppColors.redLightMode
//           ..focus = _AppColors.grey
//           ..accentTxt = _AppColors.textLight
//           ..txt = _AppColors.textDark;

//       case ThemeType.DarkMode:
//         return AppTheme(primaryColor: primaryColor)
//           ..isDark = true
//           ..bg = _AppColors.blackBackground
//           ..surface = _AppColors.blackSurface
//           ..primary = primaryColor ?? _AppColors.primary
//           ..primaryVariant = primaryColorVariant
//           ..secondary = _AppColors.accentDark
//           ..secondaryVariant = _AppColors.accent
//           ..grey = _AppColors.grey
//           ..error = _AppColors.redDarkMode
//           ..focus = _AppColors.grey
//           ..accentTxt = _AppColors.textDark
//           ..txt = _AppColors.textLight;
//     }
//   }
//   final Color? primaryColor;

//   static ThemeType defaultTheme = ThemeType.LightMode;

//   late bool isDark;
//   late Color bg;
//   late Color surface;
//   late Color primary;
//   late Color primaryVariant;
//   late Color secondary;
//   late Color secondaryVariant;
//   late Color grey;
//   late Color error;
//   late Color focus;

//   late Color txt;
//   late Color accentTxt;

//   ThemeData get themeData {
//     final t = ThemeData.from(
//       textTheme: _buildTextTheme(),
//       colorScheme: ColorScheme(
//         brightness: isDark ? Brightness.dark : Brightness.light,
//         primary: primary,
//         primaryVariant: primaryVariant,
//         secondary: secondary,
//         secondaryVariant: secondaryVariant,
//         background: bg,
//         surface: surface,
//         onBackground: txt,
//         onSurface: txt,
//         onError: txt,
//         onPrimary: isDark ? accentTxt : txt,
//         onSecondary: accentTxt,
//         error: error,
//       ),
//     );
//     return t.copyWith(
//         appBarTheme: AppBarTheme(
//             systemOverlayStyle: isDark
//                 ? SystemUiOverlayStyle.dark
//                 : SystemUiOverlayStyle.light),
//         brightness: isDark ? Brightness.dark : Brightness.light,
//         typography: Typography.material2018(),
//         accentTextTheme: _buildTextTheme().apply(bodyColor: accentTxt),
//         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         textSelectionTheme: TextSelectionThemeData(
//           cursorColor: primary,
//           selectionColor: grey,
//           selectionHandleColor: Colors.transparent,
//         ),
//         iconTheme: IconThemeData(color: grey, size: 30),
//         buttonColor: primary,
//         // this theme currently used for HomeButtonNav only
//         // if other TextButtons are used, it will need to be extracted
//         textButtonTheme: TextButtonThemeData(
//           style: ButtonStyle(
//             shape:
//                 MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
//             foregroundColor: MaterialStateProperty.all<Color>(txt),
//             overlayColor: MaterialStateProperty.resolveWith<Color?>(
//               (Set<MaterialState> states) {
//                 if (states.contains(MaterialState.hovered))
//                   return grey.withOpacity(0.04);
//                 if (states.contains(MaterialState.focused) ||
//                     states.contains(MaterialState.pressed))
//                   return grey.withOpacity(0.12);
//                 return null; // Defer to the widget's default.
//               },
//             ),
//           ),
//         ),
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           backgroundColor: primary,
//           foregroundColor: isDark ? accentTxt : txt,
//         ),
//         highlightColor: primaryVariant,
//         toggleableActiveColor: primaryVariant);
//   }
// }
