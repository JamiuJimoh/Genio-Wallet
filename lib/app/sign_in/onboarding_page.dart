import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../model/onboarding_model.dart';
import 'email_sign_in/email_sign_in_page.dart';
import 'onboarding/onboard_item.dart';
import 'onboarding/onboarding_data.dart';
import 'widgets/socials_sign_in_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currIndex = 0;
  late final List<Onboarding> data;
  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    data = OnboardingData().data;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 30.0),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: data.length,
                  itemBuilder: (_, i) => OnboardItem(
                    assetName: data[i].svg,
                    title: data[i].title,
                    subtitle: data[i].subtitle,
                  ),
                  onPageChanged: (i) => setState(() => currIndex = i),
                ),
              ),
              // const SizedBox(height: 40.0),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 60.0),
              currIndex < data.length - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text('Skip'),
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () => _controller.animateToPage(
                            data.length - 1,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.bounceInOut,
                          ),
                        ),
                        TextButton(
                          // label: Text('Next'),
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Row(
                            children: const [
                              Text('Next'),
                              SizedBox(width: 8.0),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                          onPressed: () => _controller.animateToPage(
                            ++currIndex,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.bounceInOut,
                          ),
                        ),
                      ],
                    )
                  : SocialsSignInButton(
                      context: context,
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => EmailSignInPage())),
                    ),
              const SizedBox(height: 10.0),

              // const SizedBox(height: 10.0),
              // Expanded(
              //   // flex: 4,
              //   child: SocialSignInContainer(
              //     child: Padding(
              //       padding: const EdgeInsets.only(bottom: 20.0),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           // SocialsSignInButton(
              //           //   buttonType: SignInButtonType.google,
              //           //   context: context,
              //           // ),
              //           // SocialsSignInButton(
              //           //   buttonType: SignInButtonType.facebook,
              //           //   context: context,
              //           // ),
              //           SocialsSignInButton(
              //             context: context,
              //   onPressed: () => Navigator.of(context).push(
              //       MaterialPageRoute(
              //           builder: (_) => const EmailSignInPage())),
              // ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
