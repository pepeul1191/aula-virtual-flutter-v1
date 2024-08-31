import 'package:flutter/material.dart';
import 'components/course_card.dart';
import 'components/course_drawer.dart'; // Asegúrate de tener este archivo con el Drawer definido
import 'configs/theme.dart'; // Importa el tema si es necesario

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // Asigna la clave al Scaffold
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          title: Text('Aula Virtual - PM 2024-2'),
          // Opcional: puedes agregar un icono de menú en el AppBar si lo deseas
          leading: SizedBox.shrink(),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Manejar la selección del menú
                switch (value) {
                  case 'Item 1':
                    // Acción para el primer ítem
                    print('Item 1 selected');
                    break;
                  case 'Item 2':
                    // Acción para el segundo ítem
                    print('Item 2 selected');
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Item 1',
                    child: Text('Item 1'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Item 2',
                    child: Text('Item 2'),
                  ),
                  // Agrega más items aquí si es necesario
                ];
              },
            ),
          ],
        ),
        drawer: CourseDrawer(), // Asegúrate de que este es tu Drawer
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
                          _openDrawer();
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
