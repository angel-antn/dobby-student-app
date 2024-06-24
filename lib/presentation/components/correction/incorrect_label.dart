import 'package:flutter/material.dart';

class IncorrectLabel extends StatelessWidget {
  const IncorrectLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: Image.asset('assets/images/incorrecto.png')),
        const SizedBox(
          width: 10,
        ),
        const Text('Respuesta incorrecta'),
      ],
    );
  }
}
