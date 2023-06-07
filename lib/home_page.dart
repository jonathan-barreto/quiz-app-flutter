import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:meu_quiz/wigets/button_widget.dart';
import 'package:meu_quiz/wigets/container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic pais;

  dynamic paisSorteadoId;
  dynamic paisSorteadoNome;
  dynamic paisSorteadoImage;

  String? segundaOpcao;
  String? terceiraOpcao;
  String? quartaOpcao;

  List<String?>? countries;

  @override
  void initState() {
    super.initState();
    getApi();
  }

  Future<void> getApi() async {
    final response = await Dio().get('http://192.168.0.106/api/');
    setState(() {
      pais = jsonDecode(response.data);
      paisSorteadoNome = pais[0]['nome'];
      segundaOpcao = pais[1];
      terceiraOpcao = pais[2];
      quartaOpcao = pais[3];

      final opcoes = <String?>[
        paisSorteadoNome,
        segundaOpcao,
        terceiraOpcao,
        quartaOpcao
      ];

      countries = opcoes;
      countries?.shuffle();
    });
  }

  void returnResponse(dynamic response) {
    if (response == paisSorteadoNome) {
      print('acertou $paisSorteadoNome');
    } else {
      print('errou $paisSorteadoNome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContainerRadiusWidget(
                width: 350,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'A que país pertence esta bandeira?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      if (pais != null)
                        Expanded(
                          child: Image.network(
                            'http://192.168.0.106/api/images/${pais?[0]['imagem']}',
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              ContainerRadiusWidget(
                width: 350,
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonRariusWidget(
                      text: countries?[0] ?? 'Não tem dados',
                      aoPressionar: returnResponse,
                    ),
                    ButtonRariusWidget(
                      text: countries?[1] ?? 'Não tem dados',
                      aoPressionar: returnResponse,
                    ),
                    ButtonRariusWidget(
                      text: countries?[2] ?? 'Não tem dados',
                      aoPressionar: returnResponse,
                    ),
                    ButtonRariusWidget(
                      text: countries?[3] ?? 'Não tem dados',
                      aoPressionar: returnResponse,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    getApi();
                  });
                },
                child: const ContainerRadiusWidget(
                  width: 350,
                  height: 60,
                  child: Center(
                    child: Text(
                      'CONFIRMAR',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
