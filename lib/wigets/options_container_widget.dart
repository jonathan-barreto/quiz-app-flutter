import 'package:flutter/material.dart';
import 'package:meu_quiz/wigets/alert_dialog_result_wiget.dart';
import 'package:meu_quiz/wigets/button_widget.dart';
import 'package:meu_quiz/wigets/container_widget.dart';

class OptionsContainerWidget extends StatelessWidget {
  const OptionsContainerWidget({
    super.key,
    required this.countries,
    required this.nome,
    required this.getApi,
  });

  final List<String> countries;
  final String nome;
  final Future<void> Function() getApi;

  Future<void> showSucessOrError(String response, BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialogResultWidget(
          hasError: response == nome,
        );
      },
    );
    await getApi();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerRadiusWidget(
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
              aoPressionar: (String value) => showSucessOrError(value, context),
            );
          },
        ),
      ),
    );
  }
}
