import 'package:flutter/material.dart';
import 'package:meu_quiz/wigets/container_widget.dart';

class ConfirmButtonWidget extends StatelessWidget {
  const ConfirmButtonWidget({
    super.key,
    required this.getApi,
  });

  final Future<void> Function() getApi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
