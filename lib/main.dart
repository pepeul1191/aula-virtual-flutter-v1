import 'package:aula/components/course_card.dart';
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
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor, // Configuración del primaryColor
        appBarTheme: AppBarTheme(
          backgroundColor:
              AppColors.primaryColor, // Color de fondo de la AppBar
          foregroundColor:
              Colors.white, // Color del texto e íconos de la AppBar
        ),
        textTheme: TextTheme(
          displaySmall: TextStyle(
              color: AppColors.textColor,
              fontSize: 32.0), // Título grande en tema claro
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
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor:
              AppColors.primaryColor, // Color de fondo de la AppBar
          foregroundColor:
              AppColors.textColor, // Color del texto e íconos de la AppBar
        ),
        textTheme: TextTheme(titleLarge: TextStyle(color: Colors.red)),
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
    // Color para el tema claro

    return Scaffold(
        appBar: AppBar(
          title: Text('Aula Virtual - PM 2024-2'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        CourseCard(
                          title: 'Programación Movil - 872',
                          section: '60012',
                          description:
                              'This is the description for the first card.',
                          status: 'activo',
                          imageUrl: 'aula/course01.png',
                          teacher: 'Pepe Valdivia',
                        ),
                        CourseCard(
                          title: 'Title 1',
                          status: 'concluido',
                          description:
                              'This is the description for the first card.',
                          imageUrl: 'aula/course02.png',
                          teacher: 'Pepe Valdivia',
                        ),
                        CourseCard(
                          title: 'Title 1',
                          status: 'bloqueado',
                          description:
                              'This is the description for the first card.',
                          imageUrl: 'aula/course03.png',
                          teacher: 'Pepe Valdivia',
                        ),
                        CourseCard(
                          title: 'Title 1',
                          description:
                              'This is the description for the first card.',
                          imageUrl: 'aula/course04.png',
                          teacher: 'Pepe Valdivia',
                        ),
                        CourseCard(
                          title: 'Title 1',
                          description:
                              'This is the description for the first card.',
                          imageUrl: 'aula/course05.png',
                          teacher: 'Pepe Valdivia',
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
