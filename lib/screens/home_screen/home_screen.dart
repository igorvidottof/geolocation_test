import 'package:flutter/material.dart';
import 'package:geolocation_test/screens/agendamentos_screen/agendamentos_screen.dart';
import 'package:geolocation_test/screens/clientes_screen/clientes_screen.dart';
import 'package:geolocation_test/widgets/botao_funcionalidade.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Geolocation',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              // ******* GERENCIAMENTO DE CLIENTES ***********
              BotaoFuncionalidade(
                iconeUrl: 'assets/icons/business/021-shop.png',
                texto: 'Gerenciamento de Clientes',
                isCadastro: true,
                onPressed: () => Navigator.of(context).pushNamed(
                  ClientesScreen.routeName,
                ),
              ),
              // ******* AGENDAMENTO DE VISITAS ***********
              BotaoFuncionalidade(
                iconeUrl: 'assets/icons/business/026-schedule.png',
                texto: 'Gerenciamento de Visitas',
                isCadastro: true,
                onPressed: () => Navigator.of(context).pushNamed(
                  AgendamentosScreen.routeName,
                ),
              ),
              BotaoFuncionalidade(
                iconeUrl: 'assets/icons/business/067-map.png',
                texto: 'Futuras Implementações',
                isCadastro: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
