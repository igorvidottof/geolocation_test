import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocation_test/classes/agendamento/agendamento.dart';
import 'package:geolocation_test/classes/agendamento/agendamento_controller.dart';
import 'package:geolocation_test/classes/cliente/cliente_controller.dart';
import 'package:geolocation_test/screens/agendamentos_screen/agendamentos_screen_controller.dart';
import 'package:geolocation_test/utils/theme_data.dart';
import 'package:geolocation_test/widgets/floating_action_button_personalizado.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AgendamentosScreen extends StatefulWidget {
  static const routeName = '/agendamentos-screen';

  @override
  _AgendamentosScreenState createState() => _AgendamentosScreenState();
}

class _AgendamentosScreenState extends State<AgendamentosScreen> {
  final screenCtrl = GetIt.I.get<AgendamentosScreenController>();
  final clienteCtrl = GetIt.I.get<ClienteController>();
  final agendamentoCtrl = GetIt.I.get<AgendamentoController>();
  String _clienteSelecionado = '';
  String _clienteSelecionadoId;

  void _mostraFormulario(BuildContext context) {
    _clienteSelecionado = clienteCtrl.clientes[0].nome;
    _clienteSelecionadoId = clienteCtrl.clientes[0].id;
    final temaTexto = Theme.of(context).textTheme;
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          screenCtrl.dataSelecionada = '';
                          setState(() {
                            _clienteSelecionado = clienteCtrl.clientes[0].nome;
                          });
                          _clienteSelecionadoId = clienteCtrl.clientes[0].id;
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  Text('Agendar Visita', style: temaTexto.headline3),
                  addEspacoVertical(20),
                  Row(
                    children: [
                      Text(
                        'Data: ',
                        style: temaTexto.headline4,
                      ),
                      Observer(builder: (_) {
                        return Row(
                          children: [
                            Text(screenCtrl.dataSelecionada),
                            addEspacoHorizontal(10),
                            FlatButton(
                              padding: EdgeInsets.zero,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              child: Text(
                                screenCtrl.dataSelecionada.isEmpty
                                    ? 'Selecionar Data'
                                    : 'Mudar Data',
                              ),
                              onPressed: () => _getDataSelecionada(context),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  addEspacoVertical(10),
                  Row(
                    children: [
                      Text(
                        'Cliente: ',
                        style: temaTexto.headline4,
                      ),
                      addEspacoHorizontal(10),
                      DropdownButton(
                        value: _clienteSelecionado,
                        items: clienteCtrl.clientes.map((cliente) {
                          return DropdownMenuItem(
                            child: Text(cliente.nome),
                            value: cliente.nome,
                            onTap: () {
                              _clienteSelecionadoId = cliente.id;
                              print(_clienteSelecionadoId);
                            },
                          );
                        }).toList(),
                        onChanged: (String valor) {
                          setState(() {
                            _clienteSelecionado = valor;
                          });
                        },
                      ),
                    ],
                  ),
                  addEspacoVertical(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlineButton(
                        child: Text('Salvar'),
                        borderSide: BORDA_PADRAO,
                        onPressed: () {
                          agendamentoCtrl.addAgendamento(
                            Agendamento(
                              clienteId: _clienteSelecionadoId,
                              data: screenCtrl.dataSelecionada,
                            ),
                          );
                          screenCtrl.dataSelecionada = '';
                          setState(() {
                            _clienteSelecionado = clienteCtrl.clientes[0].nome;
                          });
                          _clienteSelecionadoId = clienteCtrl.clientes[0].id;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void _getDataSelecionada(BuildContext context) async {
    DateTime dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2021, 12, 31),
    );
    screenCtrl.dataSelecionada = DateFormat('dd/MM/yy').format(dataEscolhida);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de visitas'),
      ),
      body: Text('Visita'),
      floatingActionButton: FloatingActionButtonPersonalizado(
        icone: Icons.alarm_add,
        onPressed: (context) => _mostraFormulario(context),
      ),
    );
  }
}
