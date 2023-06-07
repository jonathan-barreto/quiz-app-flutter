import 'package:flutter/material.dart';
import 'package:meu_quiz/wigets/container_widget.dart';

class ButtonRariusWidget extends StatelessWidget {
  const ButtonRariusWidget({
    super.key,
    required this.text,
    required this.aoPressionar,
  });

  final String text;
  final Function(String text) aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        aoPressionar(text);
      },
      child: ContainerRadiusWidget(
        width: 350,
        height: 60,
        color: Colors.black,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
