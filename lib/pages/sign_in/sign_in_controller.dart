import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../models/service_http_response.dart';
import '../../models/usuario.dart';
import '../../services/usuario_service.dart';

class SignInController extends GetxController {
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtContrasenia = TextEditingController();
  UsuarioService usuarioService = UsuarioService();
  RxBool enabled = true.obs;
  RxString mensaje = ''.obs;

  Future<void> signIn(BuildContext context) async {
    if (enabled.value) {
      enabled.value = false;
      String usuario = txtUsuario.text;
      String contrasenia = txtContrasenia.text;
      Usuario u = Usuario(usuario: usuario, contrasenia: contrasenia);
      ServiceHttpResponse? response = await usuarioService.signIn(u);
      if (response != null) {
        if (response.status == 200) {
          mensaje.value = 'Usiario validado';
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, '/home');
            //enabled.value = true;
          });
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

  void goToResetPassword(BuildContext context) {
    if (enabled.value) {
      Navigator.pushNamed(context, '/reset-password');
    }
  }
}
