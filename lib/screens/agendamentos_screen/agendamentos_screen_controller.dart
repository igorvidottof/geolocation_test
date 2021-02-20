import 'package:mobx/mobx.dart';
part 'agendamentos_screen_controller.g.dart';

class AgendamentosScreenController = _AgendamentosScreenControllerBase
    with _$AgendamentosScreenController;

abstract class _AgendamentosScreenControllerBase with Store {
  @observable
  String dataSelecionada = '';
  @observable
  String clienteSelecionado = '';
}
