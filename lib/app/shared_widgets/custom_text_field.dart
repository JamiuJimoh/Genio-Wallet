import 'package:flutter/material.dart';

import '../../app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.onSaved,
    this.keyboardType,
  }) : super(key: key);
  final String label;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        validator: validator,
        onSaved: onSaved,
        cursorColor: AppColors.kSecondaryColor,
        style: Theme.of(context).textTheme.bodyText1,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
        ),
      ),
    );
  }
}
