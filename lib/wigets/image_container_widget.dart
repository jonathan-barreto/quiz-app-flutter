import 'package:flutter/material.dart';
import 'package:meu_quiz/wigets/container_widget.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ContainerRadiusWidget(
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
            Expanded(
              child: Image.network('http://192.168.0.106/api/images/$image'),
            ),
          ],
        ),
      ),
    );
  }
}
