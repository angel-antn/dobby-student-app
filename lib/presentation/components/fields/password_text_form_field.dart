import 'package:flutter/material.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField(
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
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscure = true;

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
      obscureText: isObscure,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: textStyle,
      validator:
          widget.validator != null ? (value) => widget.validator!(value) : null,
      onChanged:
          widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
      decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: AppColors.primaryColor,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                isObscure
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.primaryColor,
              )),
          hintText: widget.hintText,
          hintStyle: hintTextStyle,
          filled: true,
          fillColor: AppColors.translucentWhite,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          errorStyle: TextStyle(color: Colors.red.shade200)),
    );
  }
}
