import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../shared_widgets/custom_container.dart';

class SocialsSignInButton extends CustomContainer {
  SocialsSignInButton({
    Key? key,
    required BuildContext context,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          radius: 10.0,
          containerColor: AppColors.kSecondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 22.0),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'Get Started',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: AppColors.kPrimaryColor),
                ),
              ),
              const SizedBox(width: 8.0),
              const Icon(Icons.chevron_right, color: AppColors.kPrimaryColor),
            ],
          ),
        );
}
