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

  void _showBottomSheet(BuildContext context) {
    String? _selectedValue;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Opciones de Búsqueda',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  suffixIcon: Icon(Icons.search), // Icono a la derecha
                  border: OutlineInputBorder(), // Borde del TextField
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0), // Espaciado interno
                ),
              ),
              SizedBox(height: 16),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: '',

                  border: OutlineInputBorder(), // Borde del TextField
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0), // Espaciado interno
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedValue,
                    hint: Text('Choose'),
                    isExpanded: true, // Ocupa todo el ancho disponible
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Option 3',
                        child: Text('Option 3'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Especialidades'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción para el botón Limpiar
                        print('Limpiar button pressed');
                      },
                      child: Text('Limpiar'),
                    ),
                  ),
                  SizedBox(width: 8), // Espaciado entre botones
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción para el botón Buscar
                        print('Buscar button pressed');
                      },
                      child: Text('Buscar'),
                    ),
                  ),
                  SizedBox(width: 8), // Espaciado entre botones
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción para el botón Salir
                        print('Salir button pressed');
                      },
                      child: Text('Salir'),
                    ),
                  ),
                ],
              ),
              // Agrega más ListTile o widgets según sea necesario
            ],
          ),
        );
      },
    );
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Distribuye el espacio entre los widgets
                            children: [
                              Text(
                                'Mis Cursos',
                                style: TextStyle(fontSize: 22),
                              ),
                              IconButton(
                                icon: Icon(Icons
                                    .filter_list), // Cambia el ícono según tus necesidades
                                onPressed: () {
                                  // Acción a realizar cuando se toca el ícono de filtro
                                  print('Filter icon pressed');
                                  _showBottomSheet(context);
                                  // Aquí puedes abrir un diálogo, cambiar el estado, o cualquier otra acción
                                },
                              ),
                            ],
                          )),
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
