import 'package:get/get.dart';

import '../../models/seccion_docente_curso.dart';
import '../../models/usuario.dart';
import '../../services/seccion_service.dart';

class CourseController extends GetxController {
  SeccionService seccionService = SeccionService();
  var secciones = <SeccionDocenteCurso>[].obs;
  /*
  var usuario = Usuario(idUsuario: 0, correo: '').obs;

  void listarSecciones() async {
    secciones.value = await seccionService.fetchAll();
    //print(secciones.value);
  }

  void updateUsuario(Usuario u) {
    Future.delayed(Duration(seconds: 5), () {
      print('¡5 segundos han pasado!');
      // Aquí puedes colocar el código que deseas ejecutar después de 5 segundos.
      usuario.update((val) {
        val?.idUsuario = u.idUsuario;
        val?.correo = u.correo;
      });
    });
  }
  */
}
