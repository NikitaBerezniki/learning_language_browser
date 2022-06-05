
import 'package:flutter/material.dart';

ThemeData appThemeLight(BuildContext context) {
// final textTheme = Theme.of(context).textThe  me;
  const accentColor = Colors.indigo;
  const backgroundColor = Color.fromARGB(255, 241, 255, 238);
  const textButtonColor = Color.fromARGB(255, 255, 255, 255);
  const textOnBackgroundColor = Color.fromARGB(255, 95, 93, 93);
  const textOnAppBar = textButtonColor;
  const iconColor = Color.fromARGB(255, 236, 236, 236);
  const typography = TextTheme(
    button: TextStyle(color: textButtonColor, fontFamily: 'Satisfy'),
    headline4: TextStyle(
      color: textOnBackgroundColor,
      letterSpacing: 4,
      fontSize: 28,
      fontFamily: 'Satisfy',
    ),
    headline5: TextStyle(
      color: textOnBackgroundColor,
      letterSpacing: 2,
      fontSize: 24,
      fontFamily: 'Satisfy',
    ),
  );

  return ThemeData(
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: iconColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // textStyle: MaterialStateProperty.all((typography.headline4)),
        backgroundColor: MaterialStateProperty.all(accentColor),
      ),
    ),
    switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(backgroundColor),
        thumbColor: MaterialStateProperty.all(accentColor[200])),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: accentColor),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      color: accentColor,
      titleTextStyle: typography.headline4!.copyWith(color: textOnAppBar),
    ),
    textTheme: typography,
  );
}
