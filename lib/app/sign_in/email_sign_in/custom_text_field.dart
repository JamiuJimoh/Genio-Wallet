import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        label: Text(label),
        prefixIcon: icon,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(color: AppColors.kSecondaryColor),
        ),
      ),
    );
  }
}
