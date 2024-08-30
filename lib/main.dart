import 'package:aula/components/course_card.dart';
import 'package:aula/configs/colors.dart';
import 'package:flutter/material.dart';

import 'configs/theme.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Color para el tema claro

    return SafeArea(
        child: Scaffold(
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
                              id: 1,
                              title: 'Programación Movil - 872',
                              section: '60012',
                              description:
                                  'This is the description for the first card.',
                              status: 'activo',
                              imageUrl: 'aula/course01.png',
                              teacher: 'Pepe Valdivia',
                              onTap: () {
                                // Acción que se ejecuta cuando se toca el card
                                print('Course 1 tapped');
                              },
                            ),
                            CourseCard(
                              id: 2,
                              title: 'Title 1',
                              status: 'concluido',
                              description:
                                  'This is the description for the first card.',
                              imageUrl: 'aula/course02.png',
                              teacher: 'Pepe Valdivia',
                            ),
                            CourseCard(
                              id: 3,
                              title: 'Title 1',
                              status: 'bloqueado',
                              description:
                                  'This is the description for the first card.',
                              imageUrl: 'aula/course03.png',
                              teacher: 'Pepe Valdivia',
                            ),
                            CourseCard(
                              id: 4,
                              title: 'Title 1',
                              description:
                                  'This is the description for the first card.',
                              imageUrl: 'aula/course04.png',
                              teacher: 'Pepe Valdivia',
                            ),
                            CourseCard(
                              id: 5,
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
            )));
  }
}
