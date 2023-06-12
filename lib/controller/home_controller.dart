import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:meu_quiz/models/country_model.dart';

class HomeController extends ChangeNotifier {
  String? paisSorteadoNome;
  CountryQuizInfo? countryQuiz; // serialize?
  List<String> countries = [];

  bool isLoading = true;

  Future<void> getApi() async {
    var url = Uri.parse('http://192.168.0.106/api/');
    final response = await http.get(url);
    var json = jsonDecode(response.body);
    countryQuiz = CountryQuizInfo.fromJson(json);
    countries = countryQuiz!.countriesRandom;
    isLoading = false;
    notifyListeners();
  }
}
