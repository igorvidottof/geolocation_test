import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocation_test/classes/cliente/cliente_controller.dart';
import 'package:geolocation_test/screens/cadastros_screen/form_cliente.dart';
import 'package:get_it/get_it.dart';

class CadastroScreen extends StatelessWidget {
  static const routeName = '/cadastro-screen';
  final clienteCtrl = GetIt.I.get<ClienteController>();

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
