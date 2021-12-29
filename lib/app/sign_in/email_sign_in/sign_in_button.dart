import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../shared_widgets/custom_container.dart';

class SignInButton extends CustomContainer {
  SignInButton(
      {Key? key,
      required String text,
      required VoidCallback onPressed,
      required BuildContext context})
      : super(
          key: key,
          radius: 10.0,
          containerColor: AppColors.kSecondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22.0),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10.0, width: 10.0),
              // const CircleAvatar(
              //   radius: 10.0,
              //   backgroundColor: AppColors.kPrimaryColor,
              //   backgroundImage: AssetImage('assets/images/google-logo.png'),
              // ),
              FittedBox(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.kOnsecondaryColor),
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.kSecondaryColor),
            ],
          ),
        );
}
