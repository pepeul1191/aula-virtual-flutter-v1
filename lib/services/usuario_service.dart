import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../models/seccion_docente_curso.dart';
import '../configs/constants.dart';
import '../models/service_http_response.dart';
import '../models/usuario.dart';
import '../models/usuario_logueado.dart';

class UsuarioService {
  Future<ServiceHttpResponse?> signIn(Usuario usuario) async {
    ServiceHttpResponse serviceResponse = ServiceHttpResponse();
    final url = Uri.parse('${BASE_URL}usuario/validar');
    // Realizar la solicitud POST
    await http
        .post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(usuario.toJson()),
    )
        .then((response) {
      serviceResponse.status = response.statusCode;
      // Verificar si la solicitud fue exitosa
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        serviceResponse.body = UsuarioLogueado.fromMap(jsonResponse);
      } else {
        serviceResponse.body = response.body;
      }
    }).catchError((e) {
      print('Error: $e');
      serviceResponse.status = 503;
      serviceResponse.body =
          'Ocurrió un error no controlado en comunicarse con el servidor';
    });
    return serviceResponse;
  }

  Future<ServiceHttpResponse?> resetPassword(String correo) async {
    ServiceHttpResponse serviceResponse = ServiceHttpResponse();
    final url = Uri.parse('${BASE_URL}usuario/cambiar-contrasenia');
    var request = http.MultipartRequest('POST', url);
    request.fields['correo'] = correo;
    try {
      var response = await request.send();
      String responseBody = await response.stream.bytesToString();
      serviceResponse.status = response.statusCode;
      if (response.statusCode == 200) {
        serviceResponse.body = responseBody;
      } else {
        serviceResponse.body = responseBody;
      }
    } catch (e) {
      print('Error: $e');
      serviceResponse.status = 503;
      serviceResponse.body =
          'Ocurrió un error no controlado en comunicarse con el servidor';
    }

    return serviceResponse;
  }
}
