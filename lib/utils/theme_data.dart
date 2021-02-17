import 'package:flutter/material.dart';

// CORES
const COR_PRETA = Colors.black;
const COR_CINZA = Colors.grey;
const Color COR_BRANCA = Colors.white;
const COR_AZUL = Color.fromRGBO(20, 25, 45, 1);

// BORDAS
const BorderSide BORDA_PADRAO = BorderSide(
  color: COR_AZUL,
  width: 1,
);

const BorderSide BORDA_FOCO = BorderSide(
  color: COR_AZUL,
  width: 5,
);

// TEXT THEMES
const APPBAR_DARK_TEXT_THEME = TextTheme(
  bodyText1: TextStyle(color: COR_BRANCA),
);

const APPBAR_LIGHT_TEXT_THEME = TextTheme(
  bodyText1: TextStyle(color: COR_PRETA),
);

const TEXT_THEME_PADRAO = TextTheme(
  // HEADLINES
  headline1: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  ),
  headline2: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  ),
  headline3: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  headline4: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  ),
  headline5: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  ),
  headline6: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  ),

  // SUBTITLES
  subtitle1: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
  subtitle2: TextStyle(
    color: COR_CINZA,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),

  // BODYTEXT
  bodyText1: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.5,
  ),
  bodyText2: TextStyle(
    color: COR_CINZA,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.5,
  ),
);

const TEXT_THEME_PEQUENO = TextTheme(
// HEADLINES
  headline1: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  ),
  headline2: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  headline3: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  headline4: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  headline5: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  ),
  headline6: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  ),

  // SUBTITLES
  subtitle1: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  ),
  subtitle2: TextStyle(
    color: COR_CINZA,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  ),

  // BODYTEXT
  bodyText1: TextStyle(
    color: COR_PRETA,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.5,
  ),
  bodyText2: TextStyle(
    color: COR_CINZA,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.5,
  ),
);
