import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocation_test/screens/home_screen.dart';
import 'package:geolocation_test/utils/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final larguraTela = window.physicalSize.width;
    final brightness = Theme.of(context).brightness;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Geolocation',
      theme: ThemeData(
        primaryColor: COR_AZUL,
        primaryColorBrightness: Brightness.dark,
        accentColor: COR_BRANCA,
        textTheme: larguraTela < 500 ? TEXT_THEME_PEQUENO : TEXT_THEME_PADRAO,
        appBarTheme: AppBarTheme(
          textTheme: brightness == Brightness.dark
              ? APPBAR_DARK_TEXT_THEME
              : APPBAR_LIGHT_TEXT_THEME,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
