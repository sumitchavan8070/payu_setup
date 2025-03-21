import 'package:flutter/material.dart';

class CoreAppTheme {
  // final backgroundColor =
  static const Color backgroundColor = Color(0xFFF4F7FE);
  static const Color primaryColor = Color(0xFF066AC9);
  static const Color alabaster = Color(0xFFF9FAFC);
  static const Color stormGrey = Color(0xFF697386);

  static ThemeData theme({
    Color? scaffoldBackgroundColor,
    Color? primaryColor,
    String? fontFamily,
    SwitchThemeData? switchTheme,
    PopupMenuThemeData? popupMenuTheme,
    BottomSheetThemeData? bottomSheetTheme,
    InputDecorationTheme? inputDecorationTheme,
    OutlinedButtonThemeData? outlinedButtonTheme,
    PageTransitionsTheme? pageTransitionsTheme,
    ElevatedButtonThemeData? elevatedButtonTheme,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? backgroundColor,
      primaryColor: primaryColor ?? primaryColor,
      fontFamily: fontFamily ?? 'Poppins',
      useMaterial3: true,
      switchTheme: switchTheme ?? const SwitchThemeData(splashRadius: 0),
      popupMenuTheme: popupMenuTheme ?? const PopupMenuThemeData(color: Colors.white),
      bottomSheetTheme: bottomSheetTheme ??
          const BottomSheetThemeData(
            backgroundColor: Colors.white,
            showDragHandle: true,
            dragHandleSize: Size(60, 4),
            clipBehavior: Clip.hardEdge,
          ),
      inputDecorationTheme: inputDecorationTheme ??
          const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: alabaster,
            hintStyle: TextStyle(color: stormGrey),
          ),
      outlinedButtonTheme: outlinedButtonTheme ??
          OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: primaryColor,
            ),
          ),
      pageTransitionsTheme: pageTransitionsTheme ??
          const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
      elevatedButtonTheme: elevatedButtonTheme ??
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(letterSpacing: 0.15),
              backgroundColor: primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
    );
  }
}
