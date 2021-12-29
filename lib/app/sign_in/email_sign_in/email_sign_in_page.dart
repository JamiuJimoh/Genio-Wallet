import 'package:flutter/material.dart';
import 'package:genio_wallet/app/home/home_page.dart';
import 'custom_text_field.dart';
import 'sign_in_button.dart';

import '../../../app_colors.dart';

enum ButtonType { signUp, logIn }

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  ButtonType _buttonType = ButtonType.logIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomTextField(
                          label: 'Email', icon: Icon(Icons.mail)),
                      const SizedBox(height: 15.0),
                      const CustomTextField(
                          label: 'Password', icon: Icon(Icons.password)),
                      if (_buttonType == ButtonType.signUp) ...[
                        const SizedBox(height: 15.0),
                        const CustomTextField(
                            label: 'Confirm Password',
                            icon: Icon(Icons.password)),
                      ],
                      const SizedBox(height: 25.0),
                      SignInButton(
                        context: context,
                        text: _buttonType == ButtonType.logIn
                            ? 'Log In'
                            : 'Sign Up',
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      InkWell(
                        onTap: () {
                          if (_buttonType == ButtonType.logIn) {
                            setState(() {
                              _buttonType = ButtonType.signUp;
                            });
                          } else {
                            setState(() {
                              _buttonType = ButtonType.logIn;
                            });
                          }
                        },
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: _buttonType == ButtonType.logIn
                                    ? 'Don\'t have an account? '
                                    : 'Already have an account? ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    )),
                            TextSpan(
                              text: _buttonType == ButtonType.logIn
                                  ? ' REGISTER'
                                  : 'Log In',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.kAccentColor),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
