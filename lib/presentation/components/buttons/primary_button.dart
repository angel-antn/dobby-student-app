import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/buttons/touchable_opacity.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor,
  });

  final Function onTap;
  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(14),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color?.withOpacity(0.5) ??
                AppColors.primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? color ?? AppColors.purple,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
