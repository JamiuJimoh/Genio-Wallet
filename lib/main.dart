import 'package:flutter/material.dart';
import 'package:genio_wallet/app_theme.dart';

import 'app/sign_in/sign_in_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = AppTheme.light();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const SignInPage(),
    );
  }
}
