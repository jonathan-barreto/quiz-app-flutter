import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:meu_quiz/models/country_model.dart';
import 'package:meu_quiz/wigets/button_widget.dart';
import 'package:meu_quiz/wigets/container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? paisSorteadoNome;
  CountryQuizInfo? countryQuiz;
  List<String> countries = [];

  @override
  void initState() {
    super.initState();
    getApi();
  }

  Future<void> getApi() async {
    final response = await Dio().get('http://192.168.0.106/api/');
    setState(() {
      countryQuiz = CountryQuizInfo.fromJson(response.data);
      countries = countryQuiz!.countriesRandom;
    });
  }

  void showSucessOrError() {
    
  }

  void returnResponse(dynamic response) {
    if (response == paisSorteadoNome) {
      
      getApi();
    } else {
      //print('errou $paisSorteadoNome');
      getApi();
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
                      if (countryQuiz != null)
                        Expanded(
                          child: Image.network(
                            'http://192.168.0.106/api/images/${countryQuiz!.countryData.imagem}',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    countries.length,
                    (index) {
                      final String countryName = countries[index];
                      return ButtonRariusWidget(
                        text: countryName,
                        aoPressionar: returnResponse,
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  getApi();
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
