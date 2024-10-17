import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/service_http_response.dart';
import '../../models/usuario_logueado.dart';
import '../../services/seccion_service.dart';
import '../../models/seccion_docente_curso.dart';

class HomeController extends GetxController {
  SeccionService seccionService = SeccionService();
  var secciones = <SeccionDocenteCurso>[].obs;
  var usuarioLogueado = UsuarioLogueado(
          usuarioId: 0,
          usuario: '',
          nombre: '',
          codigo: 0,
          imagen: '',
          correo: '',
          tipo: '',
          personaId: 0)
      .obs;
  TextEditingController txtBuscar = TextEditingController();

  void listSecciones(int alumnoId) async {
    ServiceHttpResponse? response =
        await seccionService.fetchSeccionesAlumno(alumnoId);
    if (response != null) {
      if (response.status == 200) {
        secciones.value = response.body;
        print('listar 2!!!!!!!!!!!!!');
      } else {
        Fluttertoast.showToast(
            msg: "Error: ${response.body}", // Puedes personalizar el mensaje
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "No se pudo obtener la información del servidor",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void buscar() {
    print('buscar desde controlador');
    print(txtBuscar.text.trim());
  }

  void limpiar() {
    print('buscar desde controlador');
    txtBuscar.text = '';
  }
}
