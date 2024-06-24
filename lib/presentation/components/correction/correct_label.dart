import 'package:flutter/material.dart';

class CorrectLabel extends StatelessWidget {
  const CorrectLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: Image.asset('assets/images/correcto.png')),
        const SizedBox(
          width: 10,
        ),
        const Text('Respuesta correcta'),
      ],
    );
  }
}
