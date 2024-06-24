import 'package:flutter/material.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class HorizontalAnswer extends StatelessWidget {
  const HorizontalAnswer(
      {super.key,
      required this.onTap,
      this.response,
      required this.index,
      required this.label});

  final Function onTap;
  final int? response;
  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
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
      ),
    );
  }
}
