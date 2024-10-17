import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/service_http_response.dart';
import '../../services/usuario_service.dart';

class ResetController extends GetxController {
  TextEditingController txtCorreo = TextEditingController();
  UsuarioService usuarioService = UsuarioService();
  RxBool enabled = true.obs;
  RxString mensaje = ''.obs;

  Future<void> signIn(BuildContext context) async {
    if (enabled.value) {
      enabled.value = false;
      String correo = txtCorreo.text;
      ServiceHttpResponse? response =
          await usuarioService.resetPassword(correo);
      if (response != null) {
        print(response);
        if (response.status == 200) {
          mensaje.value = 'Contraseña actualizada';
          enabled.value = true;
        } else {
          enabled.value = true;
          mensaje.value = response.body;
        }
      } else {
        enabled.value = true;
        mensaje.value = 'No hay respuesta del servidor';
      }
    }
  }

  void goToSignUp(BuildContext context) {
    if (enabled.value) {
      Navigator.pushNamed(context, '/sign-up');
    }
  }
}
