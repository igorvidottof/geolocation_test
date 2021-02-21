import 'package:geolocation_test/classes/cliente/cliente.dart';
import 'package:mobx/mobx.dart';
part 'cliente_controller.g.dart';

class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store {
  final clientes = List<Cliente>().asObservable();

  @action
  void addCliente(Cliente cliente) {
    clientes.add(cliente);
    clientes.forEach((cliente) {
      print(cliente.id);
    });
  }

  Cliente getClienteById(String clienteId) {
    return clientes.firstWhere((cliente) => cliente.id == clienteId);
  }
}
