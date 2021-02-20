import 'package:flutter/material.dart';
import 'package:geolocation_test/classes/cliente/cliente.dart';
import 'package:geolocation_test/classes/cliente/cliente_controller.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:geolocation_test/utils/theme_data.dart';
import 'package:get_it/get_it.dart';

class FormCliente extends StatefulWidget {
  @override
  _FormClienteState createState() => _FormClienteState();
}

class _FormClienteState extends State<FormCliente> {
  final formKey = GlobalKey<FormState>();
  final clienteCtrl = GetIt.I.get<ClienteController>();
  Cliente _cliente = Cliente(
    nome: null,
    endereco: null,
  );

  bool _salvaForm() {
    final formValido = formKey.currentState.validate();
    if (formValido) {
      formKey.currentState.save();
      clienteCtrl.addCliente(_cliente);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cadastrar Cliente',
          style: temaTexto.headline3,
        ),
        addEspacoVertical(15),
        Form(
          key: formKey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOME DO CLIENTE
                TextFormField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    enabledBorder: OutlineInputBorder(borderSide: BORDA_PADRAO),
                    border: OutlineInputBorder(borderSide: BORDA_FOCO),
                  ),
                  validator: (valor) {
                    if (valor.isEmpty)
                      return 'Campo obrigatório';
                    else
                      return null;
                  },
                  onSaved: (valor) {
                    _cliente = _cliente.copyWith(nome: valor);
                  },
                ),
                addEspacoVertical(10),
                // ENDEREÇO DO CLIENTE
                TextFormField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    enabledBorder: OutlineInputBorder(borderSide: BORDA_PADRAO),
                    border: OutlineInputBorder(borderSide: BORDA_FOCO),
                  ),
                  validator: (valor) {
                    if (valor.isEmpty)
                      return 'Campo obrigatório';
                    else
                      return null;
                  },
                  onSaved: (valor) {
                    _cliente = _cliente.copyWith(endereco: valor);
                  },
                ),
              ],
            ),
          ),
        ),
        addEspacoVertical(10),
        // BOTÃO SALVAR
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlineButton(
              borderSide: BORDA_PADRAO,
              child: Text('Salvar'),
              onPressed: () {
                if (_salvaForm()) {
                  formKey.currentState.reset();
                  FocusScope.of(context).unfocus();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
