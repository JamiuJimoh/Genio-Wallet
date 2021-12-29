import 'package:flutter/material.dart';
import 'package:genio_wallet/app/sign_in/email_sign_in/email_sign_in_page.dart';

import '../../app_colors.dart';
import 'onboarding/onboarding_section.dart';
import 'widgets/socials_sign_in_button.dart';
import 'widgets/socials_sign_in_container.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: OnboardingSection(
                index: (i) => setState(() {
                  currIndex = i;
                }),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 30.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5.0,
                      backgroundColor: currIndex == 0
                          ? AppColors.kAccentColor
                          : AppColors.kAccentColorVariant,
                    ),
                    const SizedBox(width: 8.0),
                    CircleAvatar(
                      radius: 5.0,
                      backgroundColor: currIndex == 1
                          ? AppColors.kAccentColor
                          : AppColors.kAccentColorVariant,
                    ),
                    const SizedBox(width: 8.0),
                    CircleAvatar(
                      radius: 5.0,
                      backgroundColor: currIndex == 2
                          ? AppColors.kAccentColor
                          : AppColors.kAccentColorVariant,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              flex: 4,
              child: SocialSignInContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialsSignInButton(
                      buttonType: SignInButtonType.google,
                      context: context,
                    ),
                    SocialsSignInButton(
                      buttonType: SignInButtonType.facebook,
                      context: context,
                    ),
                    SocialsSignInButton(
                      context: context,
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const EmailSignInPage())),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
