import 'package:flutter/material.dart';
import 'package:genio_wallet/app_colors.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.kOnsecondaryColor,
          child: Icon(icon, color: AppColors.kSecondaryColor),
        ),
        Text(label, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
