import 'package:flutter/material.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({
    super.key,
    required this.question,
    this.color,
  });

  final String question;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color ?? AppColors.primaryColor.withOpacity(0.25),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            '•	$question',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
