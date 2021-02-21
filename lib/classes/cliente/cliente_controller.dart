import 'package:geolocation_test/classes/cliente/cliente.dart';
import 'package:mobx/mobx.dart';
part 'cliente_controller.g.dart';

class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store {
  final clientes = <Cliente>[
    Cliente(
      nome: 'MFerreti Distribuidora',
      endereco:
          'Terminal Intermodal de Carga - R. Ancilla Tonini Gago, 465 - Techno Park, Campinas - SP, 13069-135',
    )
  ].asObservable();

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
