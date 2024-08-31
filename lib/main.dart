import 'package:flutter/material.dart';
import 'configs/theme.dart';
import 'pages/home/home_page.dart'; // Importa el tema si es necesario

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
      home: HomePage(), // Tu página principal
    );
  }
}
