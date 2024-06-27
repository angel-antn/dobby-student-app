import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/results/stats.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stats(
        userId: id,
        isProfessor: true,
      ),
    );
  }
}
