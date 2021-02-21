import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocation_test/classes/cliente/cliente_controller.dart';
import 'package:geolocation_test/screens/clientes_screen/form_cliente.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:geolocation_test/utils/theme_data.dart';
import 'package:geolocation_test/widgets/floating_action_button_personalizado.dart';
import 'package:geolocation_test/widgets/icon_button_personalizado.dart';
import 'package:get_it/get_it.dart';

class ClientesScreen extends StatelessWidget {
  static const routeName = '/clientes-screen';
  final clienteCtrl = GetIt.I.get<ClienteController>();

  void _mostraFormulario(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                FormCliente(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Observer(
          builder: (_) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: clienteCtrl.clientes.length,
                    itemBuilder: (ctx, i) {
                      final cliente = clienteCtrl.clientes[i];
                      return Card(
                        shadowColor: COR_AZUL,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            leading: Icon(
                              Icons.store,
                              size: 30,
                            ),
                            title: Text(
                              cliente.nome,
                              style: temaTexto.headline4,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                            subtitle: Text(
                              cliente.endereco,
                              style: temaTexto.bodyText2,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButtonPersonalizado(
                                  icon: Icons.edit,
                                  onPressed: () {},
                                ),
                                IconButtonPersonalizado(
                                  icon: Icons.delete,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // ESPAÇO FLOATING ACTION BUTTON
                  addEspacoVertical(80),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButtonPersonalizado(
        icone: Icons.person_add,
        onPressed: (context) => _mostraFormulario(context),
      ),
    );
  }
}
