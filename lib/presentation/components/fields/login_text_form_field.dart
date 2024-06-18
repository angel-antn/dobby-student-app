import 'package:flutter/material.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField(
      {super.key,
      required this.hintText,
      required this.icon,
      this.onChanged,
      this.validator});

  final String hintText;
  final IconData icon;
  final Function? onChanged;
  final Function? validator;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1.5,
        ));

    final errorBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Colors.red.shade200,
          width: 1.5,
        ));

    const textStyle =
        TextStyle(color: Colors.black54, fontWeight: FontWeight.normal);

    const hintTextStyle =
        TextStyle(color: Colors.black26, fontWeight: FontWeight.normal);

    return TextFormField(
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: textStyle,
      validator: validator != null ? (value) => validator!(value) : null,
      onChanged: onChanged != null ? (value) => onChanged!(value) : null,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          hintText: hintText,
          hintStyle: hintTextStyle,
          filled: true,
          fillColor: AppColors.translucentWhite,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          border: inputBorder,
          errorStyle: TextStyle(color: Colors.red.shade200)),
    );
  }
}
