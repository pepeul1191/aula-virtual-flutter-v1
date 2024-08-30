import 'package:aula/configs/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor, // Configuración del primaryColor
        appBarTheme: AppBarTheme(
          backgroundColor:
              AppColors.primaryColor, // Color de fondo de la AppBar
          foregroundColor:
              Colors.white, // Color del texto e íconos de la AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor:
                  Colors.white // Color de fondo de los botones elevados
              ),
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        // Puedes definir otros aspectos del tema aquí
      ),
      darkTheme: ThemeData(
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor:
              AppColors.primaryColor, // Color de fondo de la AppBar
          foregroundColor:
              AppColors.textColor, // Color del texto e íconos de la AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor:
                  AppColors.textColor // Color de fondo de los botones elevados
              ),
        ),
        scaffoldBackgroundColor: AppColors.textColor,
        // Puedes definir otros aspectos del tema aquí
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black // Color para el tema oscuro
        : AppColors.backgroundColor; // Color para el tema claro

    return Scaffold(
      appBar: AppBar(
        title: Text('Hola Mundo App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola Mundo',
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Botón presionado')),
                );
              },
              child: Text('Presiona aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
