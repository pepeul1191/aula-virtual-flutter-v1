import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/course_card.dart';
import '../../models/seccion_docente_curso.dart';
import '../../models/usuario.dart';
import 'course_controller.dart';

class CoursePage extends StatelessWidget {
  final Usuario usuario;
  CourseController control = Get.put(CourseController());

  CoursePage({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  Widget _buildBody(BuildContext context) {
    /*
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return control.usuario.value.idUsuario != 0
                ? Text(
                    'Mis Cursos ${control.usuario.value.correo} - ${control.usuario.value.idUsuario}',
                    style: TextStyle(
                      fontSize: 22,
                    ))
                : SizedBox.shrink();
          }),
          Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: control.secciones.value.length,
                itemBuilder: (context, index) {
                  SeccionDocenteCurso seccion = control.secciones.value[index];
                  //print(seccion);
                  return CourseCard(
                    imageUrl: seccion.cursoImagen,
                    code: seccion.seccionCodigo.toString(),
                    courseTitle: seccion.cursoNombre,
                    status: 'Activo',
                    profe: seccion.docenteNombre,
                    diploma: seccion.diploma,
                    //tagColor: Colors.blue, // Puedes cambiar el color aquí
                  );
                });
          }),
        ],
      ),
    ));
    */
    return Text('hola');
  }

  @override
  Widget build(BuildContext context) {
    //control.listarSecciones();
    //control.updateUsuario(usuario);
    return _buildBody(context);
  }
}
