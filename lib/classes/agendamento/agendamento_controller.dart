import 'package:geolocation_test/classes/agendamento/agendamento.dart';
import 'package:mobx/mobx.dart';
part 'agendamento_controller.g.dart';

class AgendamentoController = _AgendamentoControllerBase
    with _$AgendamentoController;

abstract class _AgendamentoControllerBase with Store {
  final agendamentos = List<Agendamento>().asObservable();

  @action
  void addAgendamento(Agendamento agendamento) {
    agendamentos.add(agendamento);
    agendamentos.forEach((agendamento) {
      print(agendamento.data);
    });
  }
}
