import 'package:flutter/material.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class VerticalAnswer extends StatelessWidget {
  const VerticalAnswer(
      {super.key,
      required this.label,
      required this.onTap,
      this.response,
      required this.index});

  final String label;
  final Function onTap;
  final int? response;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: response == index ? AppColors.primaryColor : null,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.primaryColor)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Text(label),
        ),
      ),
    );
  }
}
