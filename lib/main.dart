import 'package:flutter/material.dart';
import 'package:genio_wallet/app/home/landing_page.dart';
import 'package:genio_wallet/app/sign_in/email_sign_in/auth_provider.dart';
import 'package:genio_wallet/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = AppTheme.light();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        // supportedLocales: ,
        title: 'Flutter Demo',
        theme: theme,
        home: const LandingPage(),
      ),
    );
  }
}
