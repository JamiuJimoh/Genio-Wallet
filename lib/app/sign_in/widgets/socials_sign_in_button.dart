import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../shared_widgets/custom_container.dart';

enum SignInButtonType { google, facebook }

class SocialsSignInButton extends CustomContainer {
  SocialsSignInButton({
    Key? key,
    SignInButtonType? buttonType,
    required BuildContext context,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          radius: 10.0,
          containerColor: AppColors.kPrimaryColor,
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 22.0),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (buttonType == SignInButtonType.google)
                const CircleAvatar(
                  radius: 10.0,
                  backgroundColor: AppColors.kPrimaryColor,
                  backgroundImage: AssetImage('assets/images/google-logo.png'),
                ),
              if (buttonType == SignInButtonType.facebook)
                // AssetImage('assets/images/meta-logo.png'),
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: Image.asset('assets/images/meta-logo.png'),
                ),
              if (buttonType == null)
                const SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: Icon(Icons.email, color: AppColors.kAccentColor),
                ),
              FittedBox(
                child: Text(
                  'Sign in with ${buttonType == null ? 'Email' : (buttonType == SignInButtonType.google ? 'Google' : 'Facebook')}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.kSecondaryColor),
            ],
          ),
        );
}
