import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocation_test/classes/agendamento/agendamento_controller.dart';
import 'package:geolocation_test/classes/cliente/cliente_controller.dart';
import 'package:geolocation_test/screens/agendamentos_screen/agendamentos_screen.dart';
import 'package:geolocation_test/screens/clientes_screen/clientes_screen.dart';
import 'package:geolocation_test/screens/home_screen/home_screen.dart';
import 'package:geolocation_test/utils/theme_data.dart';
import 'package:get_it/get_it.dart';
import 'package:geolocation_test/screens/agendamentos_screen/agendamentos_screen_controller.dart';

void main() {
  // BLOQUEIA ROTAÇÃO DO CELULAR
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final getIt = GetIt.I;
  // MODEL CONTROLLERS
  getIt.registerSingleton<ClienteController>(ClienteController());
  getIt.registerSingleton<AgendamentoController>(AgendamentoController());
  // SCREEN CONTROLLERS
  getIt.registerSingleton<AgendamentosScreenController>(
      AgendamentosScreenController());
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
        primarySwatch: COR_AZUL_SWATCH,
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
      routes: {
        ClientesScreen.routeName: (ctx) => ClientesScreen(),
        AgendamentosScreen.routeName: (ctx) => AgendamentosScreen(),
      },
    );
  }
}
