import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  late final List<Map<String, Object>> perguntas;
  late final int perguntaSelecionada;
  late final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? (perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>)
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["texto"] as String),
        ...respostas
            .map((resp) => Resposta(resp['texto'] as String,
                () => responder(resp['pontuacao'] as int)))
            .toList(),
      ],
    );
  }
}
