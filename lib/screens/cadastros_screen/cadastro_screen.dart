import 'package:flutter/material.dart';
import 'package:geolocation_test/screens/cadastros_screen/form_cliente.dart';

class CadastroScreen extends StatelessWidget {
  static const routeName = '/cadastro-screen';

  @override
  Widget build(BuildContext context) {
    final String tituloAppBar = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormCliente(),
      ),
    );
  }
}
