import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/seccion_service.dart';
import '../../models/seccion_docente_curso.dart';

class HomeController extends GetxController {
  SeccionService seccionService = SeccionService();
  var secciones = <SeccionDocenteCurso>[].obs;
  TextEditingController txtBuscar = TextEditingController();

  void listSecciones() async {
    print('listar 1!!!!!!!!!!!!!');
    secciones.value = await seccionService.fetchAll();
    print(secciones.value);
    secciones.value = secciones.value;
    print('listar 2!!!!!!!!!!!!!');
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
