import 'package:flutter/material.dart';
import '../../components/app_menu_button.dart';
import '../../components/course_card.dart';
import '../../components/course_drawer.dart'; // Asegúrate de tener este archivo con el Drawer definido
import '../../configs/theme.dart'; // Importa el tema si es necesario

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0; // Índice de la pestaña seleccionada
  int? _selectedCourseId;

  void _openDrawer(int courseId) {
    setState(() {
      _selectedCourseId = courseId; // Actualiza el ID del curso seleccionado
    });
    _scaffoldKey.currentState?.openDrawer();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            AppMenuButton(
              context: context, // Pasar el contexto
              onSelected: (value) {
                // Manejar la selección del menú si es necesario
                print('Menu item selected from outside: $value');
              },
            ),
          ],
        ),
        drawer: CourseDrawer(courseId: _selectedCourseId),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book), // Icono para Mis Cursos
              label: 'Mis Cursos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications), // Icono para Notificaciones
              label: 'Notificaciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), // Icono para Calendario
              label: 'Calendario',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
// Asegúrate de que este es tu Drawer
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
                          _openDrawer(1);
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
                        onTap: () {
                          // Acción que se ejecuta cuando se toca el card
                          print('Course 2 tapped');
                          _openDrawer(2);
                        },
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
