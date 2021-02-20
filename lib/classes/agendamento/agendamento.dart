import 'package:flutter/material.dart';

class Agendamento {
  Agendamento({
    @required this.data,
    this.distancia,
    this.reembolso,
    @required this.clienteId,
  });
  final String data;
  final double distancia;
  final double reembolso;
  final String clienteId;

  // CONVERTER MAP EM MODEL
  factory Agendamento.fromMap(Map<String, dynamic> agendamento) {
    if (agendamento == null) {
      return null;
    }
    return Agendamento(
      data: agendamento['data'],
      distancia: agendamento['distancia'],
      reembolso: agendamento['reembolso'],
      clienteId: agendamento['clienteId'],
    );
  }

  // CONVERTER MODEL EM MAP
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'distancia': distancia,
      'reembolso': reembolso,
      'clienteId': clienteId
    };
  }

  // EDITAR INSTÂNCIA DA CLASSE
  Agendamento copyWith({
    String data,
    double distancia,
    double reembolso,
    String clienteId,
  }) {
    return Agendamento(
      data: data ?? this.data,
      distancia: distancia ?? this.distancia,
      reembolso: reembolso ?? this.reembolso,
      clienteId: clienteId ?? this.clienteId,
    );
  }
}
