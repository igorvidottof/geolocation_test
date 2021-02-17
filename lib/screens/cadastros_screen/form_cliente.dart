import 'package:flutter/material.dart';
import 'package:geolocation_test/classes/cliente/cliente.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:geolocation_test/utils/theme_data.dart';

class FormCliente extends StatefulWidget {
  @override
  _FormClienteState createState() => _FormClienteState();
}

class _FormClienteState extends State<FormCliente> {
  final formKey = GlobalKey<FormState>();
  Cliente cliente = Cliente(
    nome: null,
    endereco: null,
  );

  bool _salvaForm() {
    final formValido = formKey.currentState.validate();
    if (formValido) {
      formKey.currentState.save();
      print(cliente.nome);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
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
                    cliente = cliente.copyWith(nome: valor);
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
                    cliente = cliente.copyWith(endereco: valor);
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlineButton(
              borderSide: BORDA_PADRAO,
              child: Text('Salvar form'),
              onPressed: () {
                if (_salvaForm()) {
                  formKey.currentState.reset();
                  FocusScope.of(context).unfocus();
                }
              },
            ),
            OutlineButton(
              borderSide: BORDA_PADRAO,
              child: Text('Limpar campos'),
              onPressed: () {
                formKey.currentState.reset();
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        ),
      ],
    );
  }
}
