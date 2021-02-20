import 'package:flutter/material.dart';

class Cliente {
  Cliente({
    @required this.nome,
    @required this.endereco,
  });
  final String id = DateTime.now().toString();
  final String nome;
  final String endereco;

  // CONVERTER MAP EM MODEL
  factory Cliente.fromMap(Map<String, dynamic> cliente) {
    if (cliente == null) {
      return null;
    }
    return Cliente(
      nome: cliente['nome'],
      endereco: cliente['endereco'],
    );
  }

  // CONVERTER MODEL EM MAP
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'endereco': endereco,
    };
  }

  // EDITAR INSTÂNCIA DA CLASSE
  Cliente copyWith({
    String nome,
    String endereco,
  }) {
    return Cliente(
      nome: nome ?? this.nome,
      endereco: endereco ?? this.endereco,
    );
  }
}
