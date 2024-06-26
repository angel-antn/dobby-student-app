import 'package:flutter/material.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class HorizontalAnswer extends StatelessWidget {
  const HorizontalAnswer(
      {super.key,
      required this.onTap,
      this.response,
      required this.index,
      required this.label,
      this.borderColor});

  final Function onTap;
  final int? response;
  final int index;
  final String label;
  final Color? borderColor;

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
              color: response == index
                  ? borderColor ?? AppColors.primaryColor
                  : null,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: borderColor ?? AppColors.primaryColor)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
