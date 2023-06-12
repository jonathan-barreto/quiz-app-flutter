import 'package:flutter/material.dart';

class AlertDialogResultWidget extends StatelessWidget {
  const AlertDialogResultWidget({
    super.key,
    required this.hasError,
  });

  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Result'),
      content: Text(hasError ? 'acertou' : 'errou'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('fechar'),
        )
      ],
    );
  }
}
