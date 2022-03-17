/*
Tarefa
 possui descrição
 possui status (completo ou não)
 possui data de criação
*/
import 'package:flutter/foundation.dart';

@immutable
class Tarefa {
  final String descricao;
  final bool taCompleta;
  final DateTime criadoEm;

  Tarefa(
    this.descricao, {
    bool? taCompleta,
    DateTime? criadoEm,
  })  : taCompleta = taCompleta ?? false,
        criadoEm = criadoEm ?? DateTime.now();

  Tarefa copiarCom({
    String? descricao,
    bool? taCompleta,
  }) {
    return Tarefa(
      descricao ?? this.descricao,
      taCompleta: taCompleta ?? this.taCompleta,
      criadoEm: criadoEm,
    );
  }

  @override
  String toString() {
    return 'Tarefa($descricao, $taCompleta, $criadoEm)';
  }
}
