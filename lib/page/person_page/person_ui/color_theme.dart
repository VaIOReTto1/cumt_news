import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData themeData;

  AppTheme(this.themeData);

  factory AppTheme.greenTheme() {
    return AppTheme(
      ThemeData(
        cardTheme: CardTheme(
          color: Colors.green[300]!, // 更改Card的颜色
        ),
        scaffoldBackgroundColor: Colors.green[100],
        canvasColor: Colors.green[100],
        colorScheme: ColorScheme(
          primary: Colors.green[300]!,
          secondary: Colors.greenAccent[400]!,
          background: Colors.green[100]!,
          error: Colors.redAccent[700]!,
          brightness: Brightness.light,
          onBackground: Colors.green[300]!,
          onError: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.green[300]!,
          onSurface: Colors.green[300]!,
          surface: Colors.green[50]!,
        ),
      ),
    );
  }

  factory AppTheme.blueTheme() {
    return AppTheme(
      ThemeData(
          cardTheme: CardTheme(
            color: Colors.blue[300]!, // 更改Card的颜色
          ),
          scaffoldBackgroundColor: Colors.blue[100],
          canvasColor: Colors.blue[100],
          colorScheme: ColorScheme(
              primary: Colors.blue[300]!,
              secondary: Colors.blueAccent[400]!,
              background: Colors.blue[100]!,
              error: Colors.redAccent[700]!,
              brightness: Brightness.light,
              onBackground: Colors.blue[300]!,
              onError: Colors.white,
              onPrimary: Colors.white,
              onSecondary: Colors.blue[300]!,
              onSurface: Colors.blue[300]!,
              surface: Colors.blue[50]!)));
  }

  factory AppTheme.redTheme() {
    return AppTheme(
        ThemeData(
            cardTheme: CardTheme(
              color: Colors.red[300]!, // 更改Card的颜色
            ),
            scaffoldBackgroundColor: Colors.red[100],
            canvasColor: Colors.red[100],
            colorScheme: ColorScheme(
                primary: Colors.red[300]!,
                secondary: Colors.red[400]!,
                background: Colors.red[100]!,
                error: Colors.redAccent[700]!,
                brightness: Brightness.light,
                onBackground: Colors.red[300]!,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.red[300]!,
                onSurface: Colors.red[300]!,
                surface: Colors.red[50]!)));
  }

  factory AppTheme.yellowTheme() {
    return AppTheme(
        ThemeData(
            cardTheme: CardTheme(
              color: Colors.yellow[300]!, // 更改Card的颜色
            ),
            scaffoldBackgroundColor: Colors.yellow[100],
            canvasColor: Colors.yellow[100],
            colorScheme: ColorScheme(
                primary: Colors.yellow[300]!,
                secondary: Colors.yellow[400]!,
                background: Colors.yellow[100]!,
                error: Colors.yellowAccent[700]!,
                brightness: Brightness.light,
                onBackground: Colors.yellow[300]!,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.yellow[300]!,
                onSurface: Colors.yellow[300]!,
                surface: Colors.yellow[50]!)));
  }

  factory AppTheme.greyTheme() {
    return AppTheme(
        ThemeData(
            cardTheme: CardTheme(
              color: Colors.grey[300]!, // 更改Card的颜色
            ),
            scaffoldBackgroundColor: Colors.grey[100],
            canvasColor: Colors.grey[100],
            colorScheme: ColorScheme(
                primary: Colors.grey[300]!,
                secondary: Colors.grey[400]!,
                background: Colors.grey[100]!,
                error: Colors.blueGrey[700]!,
                brightness: Brightness.light,
                onBackground: Colors.grey[300]!,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.grey[300]!,
                onSurface: Colors.grey[300]!,
                surface: Colors.grey[50]!)));
  }

  factory AppTheme.pinkTheme() {
    return AppTheme(
        ThemeData(
            cardTheme: CardTheme(
              color: Colors.pink[300]!, // 更改Card的颜色
            ),
            scaffoldBackgroundColor: Colors.pink[100],
            canvasColor: Colors.pink[100],
            colorScheme: ColorScheme(
                primary: Colors.pink[300]!,
                secondary: Colors.pink[400]!,
                background: Colors.pink[100]!,
                error: Colors.pink[700]!,
                brightness: Brightness.light,
                onBackground: Colors.pink[300]!,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.pink[300]!,
                onSurface: Colors.pink[300]!,
                surface: Colors.pink[50]!)));
  }

  factory AppTheme.purpleTheme() {
    return AppTheme(
        ThemeData(
            cardTheme: CardTheme(
              color: Colors.purple[300]!, // 更改Card的颜色
            ),
            scaffoldBackgroundColor: Colors.purple[100],
            canvasColor: Colors.purple[100],
            colorScheme: ColorScheme(
                primary: Colors.purple[300]!,
                secondary: Colors.purple[400]!,
                background: Colors.purple[100]!,
                error: Colors.purple[700]!,
                brightness: Brightness.light,
                onBackground: Colors.purple[300]!,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.purple[300]!,
                onSurface: Colors.purple[300]!,
                surface: Colors.purple[50]!)));
  }

}
