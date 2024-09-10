import 'package:get/get.dart';
import '../../services/seccion_service.dart';
import '../../models/seccion_docente_curso.dart';

class HomeController extends GetxController {
  SeccionService seccionService = SeccionService();
  var secciones = <SeccionDocenteCurso>[].obs;

  void listSecciones() async {
    secciones.value = await seccionService.fetchAll();
  }
}
