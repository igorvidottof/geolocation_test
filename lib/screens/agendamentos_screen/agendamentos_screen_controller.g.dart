// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamentos_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentosScreenController
    on _AgendamentosScreenControllerBase, Store {
  final _$dataSelecionadaAtom =
      Atom(name: '_AgendamentosScreenControllerBase.dataSelecionada');

  @override
  String get dataSelecionada {
    _$dataSelecionadaAtom.reportRead();
    return super.dataSelecionada;
  }

  @override
  set dataSelecionada(String value) {
    _$dataSelecionadaAtom.reportWrite(value, super.dataSelecionada, () {
      super.dataSelecionada = value;
    });
  }

  final _$clienteSelecionadoAtom =
      Atom(name: '_AgendamentosScreenControllerBase.clienteSelecionado');

  @override
  String get clienteSelecionado {
    _$clienteSelecionadoAtom.reportRead();
    return super.clienteSelecionado;
  }

  @override
  set clienteSelecionado(String value) {
    _$clienteSelecionadoAtom.reportWrite(value, super.clienteSelecionado, () {
      super.clienteSelecionado = value;
    });
  }

  @override
  String toString() {
    return '''
dataSelecionada: ${dataSelecionada},
clienteSelecionado: ${clienteSelecionado}
    ''';
  }
}
