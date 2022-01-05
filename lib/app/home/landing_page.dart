import 'package:flutter/material.dart';
import 'package:genio_wallet/app/sign_in/onboarding_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return OnboardingPage();
  }
}
