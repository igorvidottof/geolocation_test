import 'package:flutter/material.dart';
import 'package:geolocation_test/screens/cadastros_screen/cadastro_screen.dart';
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
              BotaoFuncionalidade(
                iconeUrl: 'assets/icons/business/021-shop.png',
                texto: 'Adicionar Cliente',
                isCadastro: true,
                onPressed: () => Navigator.of(context).pushNamed(
                  CadastroScreen.routeName,
                  arguments: 'Adicionar Cliente',
                ),
              ),
              BotaoFuncionalidade(
                iconeUrl: 'assets/icons/business/026-schedule.png',
                texto: 'Ver agendamentos',
                isCadastro: false,
                onPressed: () {},
              ),
              BotaoFuncionalidade(
                iconeUrl: 'assets/icons/business/067-map.png',
                texto: 'Calcular trajeto',
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
