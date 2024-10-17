import 'package:aula/models/usuario_logueado.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../models/service_http_response.dart';
import '../../models/usuario.dart';
import '../../services/usuario_service.dart';
import '../home/home_page.dart';

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
          UsuarioLogueado usuarioLogueado = response.body;
          Future.delayed(Duration(seconds: 3), () {
            //Navigator.pushReplacementNamed(context, '/home');
            //enabled.value = true;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) =>
                    HomePage(), // Reemplaza con tu widget de Home
                settings: RouteSettings(arguments: usuarioLogueado.toJson()),
              ),
              (Route<dynamic> route) =>
                  false, // Elimina todas las rutas anteriores
            );
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
