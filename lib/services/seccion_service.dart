import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../configs/constants.dart';
import 'package:http/http.dart' as http;
import '../models/seccion_docente_curso.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

import '../models/service_http_response.dart';

class SeccionService {
  Future<List<SeccionDocenteCurso>> fetchAll2(alumnoId) async {
    List<SeccionDocenteCurso> secciones = [];
    final String response =
        await rootBundle.loadString('assets/json/secciones.json');
    final List<dynamic> data = jsonDecode(response);
    secciones = data
        .map((map) => SeccionDocenteCurso.fromMap(map as Map<String, dynamic>))
        .toList();
    return secciones;
  }

  Future<ServiceHttpResponse?> fetchSeccionesAlumno(int alumnoId) async {
    ServiceHttpResponse serviceResponse = ServiceHttpResponse();
    List<SeccionDocenteCurso> secciones = [];
    final url = Uri.parse('${BASE_URL}seccion/alumno?alumno_id=1/$alumnoId');
    try {
      final response = await http.get(url);
      serviceResponse.status = response.statusCode;
      if (response.statusCode == 200) {
        //print(response.body);
        final List<dynamic> parsedData = json.decode(response.body);
        secciones = parsedData
            .map((bodyPartJson) => SeccionDocenteCurso.fromMap(bodyPartJson))
            .toList();
        serviceResponse.status = 200;
        serviceResponse.body = secciones;
      } else {
        serviceResponse.body = response.body;
        serviceResponse.status = response.statusCode;
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
      serviceResponse.status = 503;
      serviceResponse.body =
          'Ocurrió un error no controlado en comunicarse con el servidor y traer la lista de secciones';
    }
    return serviceResponse;
  }
}
