import 'package:flutter/material.dart';
import 'package:meu_quiz/controller/home_controller.dart';
import 'package:meu_quiz/wigets/confirm_button_widget.dart';
import 'package:meu_quiz/wigets/image_container_widget.dart';
import 'package:meu_quiz/wigets/options_container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getApi();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageContainerWidget(
                      image: controller.countryQuiz!.countryData.imagem),
                  OptionsContainerWidget(
                    countries: controller.countries,
                    nome: controller.countryQuiz!.countryData.nome,
                    getApi: controller.getApi,
                  ),
                  ConfirmButtonWidget(getApi: controller.getApi),
                ],
              ),
      ),
    );
  }
}
