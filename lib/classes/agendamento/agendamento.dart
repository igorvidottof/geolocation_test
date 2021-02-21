import 'package:flutter/material.dart';

class Agendamento {
  Agendamento({
    @required this.data,
    this.distancia,
    this.reembolso,
    @required this.clienteId,
    this.visitaConcluida,
  });
  final String data;
  final double distancia;
  final double reembolso;
  final String clienteId;
  bool visitaConcluida = false;

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
      visitaConcluida: agendamento['visitaConcluida'],
    );
  }

  // CONVERTER MODEL EM MAP
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'distancia': distancia,
      'reembolso': reembolso,
      'clienteId': clienteId,
      'visitaConcluida': visitaConcluida,
    };
  }

  // EDITAR INSTÂNCIA DA CLASSE
  Agendamento copyWith({
    String data,
    double distancia,
    double reembolso,
    String clienteId,
    bool visitaConcluida,
  }) {
    return Agendamento(
      data: data ?? this.data,
      distancia: distancia ?? this.distancia,
      reembolso: reembolso ?? this.reembolso,
      clienteId: clienteId ?? this.clienteId,
      visitaConcluida: visitaConcluida ?? this.visitaConcluida,
    );
  }
}
