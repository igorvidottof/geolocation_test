import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocation_test/classes/agendamento/agendamento.dart';
import 'package:geolocation_test/classes/agendamento/agendamento_controller.dart';
import 'package:geolocation_test/classes/cliente/cliente.dart';
import 'package:geolocation_test/classes/cliente/cliente_controller.dart';
import 'package:geolocation_test/screens/agendamentos_screen/agendamentos_screen_controller.dart';
import 'package:geolocation_test/services/maps_service.dart';
import 'package:geolocation_test/utils/theme_data.dart';
import 'package:geolocation_test/widgets/floating_action_button_personalizado.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:geolocation_test/widgets/icon_button_personalizado.dart';
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
                  // DATEPICKER DATA
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

                  // DROPDOWNBUTTON CLIENTE
                  Column(
                    children: [
                      Text(
                        'Cliente: ',
                        style: temaTexto.headline4,
                      ),
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
                          if (screenCtrl.dataSelecionada.isEmpty) {
                            return;
                          }
                          agendamentoCtrl.addAgendamento(
                            Agendamento(
                              clienteId: _clienteSelecionadoId,
                              data: screenCtrl.dataSelecionada,
                              visitaConcluida: false,
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
    final temaTexto = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de visitas'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Observer(
            builder: (_) {
              return ListView.builder(
                itemCount: agendamentoCtrl.agendamentos.length,
                itemBuilder: (ctx, i) {
                  final agendamento = agendamentoCtrl.agendamentos[i];
                  final cliente = clienteCtrl.getClienteById(
                    agendamento.clienteId,
                  );
                  return AgendamentoListItem(
                    key: ValueKey(i),
                    agendamento: agendamento,
                    cliente: cliente,
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonPersonalizado(
        icone: Icons.alarm_add,
        onPressed: (context) => _mostraFormulario(context),
      ),
    );
  }
}

class AgendamentoListItem extends StatefulWidget {
  const AgendamentoListItem({this.key, this.agendamento, this.cliente})
      : super(key: key);
  final Agendamento agendamento;
  final Cliente cliente;
  final Key key;

  @override
  _AgendamentoListItemState createState() => _AgendamentoListItemState();
}

class _AgendamentoListItemState extends State<AgendamentoListItem> {
  bool _visitaIniciada = false;

  @override
  Widget build(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;
    return Card(
      shadowColor: COR_AZUL,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Icon(
                Icons.perm_contact_calendar,
                size: 30,
              ),
              title: Text(
                widget.agendamento.data,
                style: temaTexto.headline4,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              subtitle: Text(
                widget.cliente.nome,
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
            Divider(),
            widget.agendamento.visitaConcluida
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                      addEspacoHorizontal(5),
                      Text('Visita Concluída')
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _visitaIniciada
                          ? CircularProgressIndicator(
                              backgroundColor: COR_AZUL,
                            )
                          : OutlineButton(
                              child: Text('Iniciar Visita'),
                              onPressed: () {
                                setState(() {
                                  _visitaIniciada = true;
                                });
                              },
                            ),
                      addEspacoHorizontal(8),
                      OutlineButton(
                        child: Text('Melhor Trajeto'),
                        onPressed: () {
                          MapsService.abrirMaps(widget.cliente.endereco);
                        },
                      ),
                      _visitaIniciada
                          ? Row(
                              children: [
                                addEspacoHorizontal(8),
                                OutlineButton(
                                  child: Text('Finalizar Visita'),
                                  onPressed: () {
                                    setState(() {
                                      _visitaIniciada = false;

                                      widget.agendamento.visitaConcluida = true;
                                    });
                                  },
                                ),
                              ],
                            )
                          : SizedBox()
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
