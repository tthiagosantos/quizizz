import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      'texto': "Qual é a sua cor favorita?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 8},
        {'texto': 'Verde', 'pontuacao': 9},
        {'texto': 'Branco', 'pontuacao': 7},
      ]
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 9},
        {'texto': 'Hiena', 'pontuacao': 8},
        {'texto': 'Tigre', 'pontuacao': 7},
      ]
    },
    {
      'texto': "Qual é o seu Livro favorito?",
      'respostas': [
        {'texto': 'Codigo limpo', 'pontuacao': 9},
        {'texto': 'Arquitetura limpa', 'pontuacao': 7},
        {'texto': 'Algoritimo', 'pontuacao': 6},
      ]
    },
  ];
  var perguntaSelecionada = 0;
  var pontuacaoTotal = 0;
  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("PERGUNTAS"),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: perguntaSelecionada,
                  responder: responder,
                )
              : Resultado(),
        ),
      ),
    ); // Adicione o parêntese aqui
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return PerguntaAppState();
  }
}
