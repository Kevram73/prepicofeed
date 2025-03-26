import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

enum AppTheme {
  LightTheme,
}

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: kColorPrimary,
      ),
      actionsIconTheme: IconThemeData(
        color: kColorPrimary,
      ),
      titleTextStyle: TextStyle(
        color: kColorDarkBlue,
        fontFamily: 'NunitoSans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      labelLarge: kTextStyleButton,
      titleMedium: kTextStyleSubtitle1.copyWith(color: kColorPrimaryDark),
      titleSmall: kTextStyleSubtitle2.copyWith(color: kColorPrimaryDark),
      bodyMedium: kTextStyleBody2.copyWith(color: kColorPrimaryDark),
      headlineSmall: kTextStyleHeadline6.copyWith(color: kColorPrimaryDark),
    ),
    iconTheme: IconThemeData(
      color: kColorPrimary,
    ),
    fontFamily: 'NunitoSans',
    cardTheme: CardTheme(
      elevation: 0,
      color: Color(0xffEBF2F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        //side: BorderSide(width: 1, color: Colors.grey[200]),
      ),
    ), checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return kColorPrimary; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return kColorPrimary; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return kColorPrimary; }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return kColorPrimary; }
 return null;
 }),
 ),
  ),

};
