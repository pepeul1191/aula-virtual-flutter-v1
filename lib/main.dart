import 'package:flutter/material.dart';
import 'configs/theme.dart';
import 'pages/home/home_page.dart';
import 'pages/reset/reset_page.dart';
import 'pages/sign_in/sign_in_page.dart';
import 'pages/sign_up/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          AppTheme.lightTheme(), // Usa el tema claro definido en app_theme.dart
      darkTheme:
          AppTheme.darkTheme(), // Usa el tema oscuro definido en app_theme.dart
      //home: HomePage(), // Tu página principal
      initialRoute: '/sign-in',
      routes: {
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/reset-password': (context) => ResetPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
