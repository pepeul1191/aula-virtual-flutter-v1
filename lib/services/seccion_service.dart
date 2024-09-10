import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/seccion_docente_curso.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class SeccionService {
  Future<List<SeccionDocenteCurso>> fetchAll() async {
    List<SeccionDocenteCurso> secciones = [];
    final String response =
        await rootBundle.loadString('assets/json/secciones.json');
    final List<dynamic> data = jsonDecode(response);
    secciones = data
        .map((map) => SeccionDocenteCurso.fromMap(map as Map<String, dynamic>))
        .toList();
    return secciones;
  }
}
