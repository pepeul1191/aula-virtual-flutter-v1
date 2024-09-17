import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtContrasenia = TextEditingController();
  RxString mensaje = ''.obs;

  void signIn(BuildContext context) {
    if (txtUsuario.text == 'admin' && txtContrasenia.text == '123') {
      print('ifffff');
      mensaje.value = '';
      Future.delayed(Duration(seconds: 3), () {
        print('TimeOut');
        Navigator.pushNamed(context, '/home');
      });
    } else {
      mensaje.value = 'Usuario y/o contraseña incorrectos';
    }
  }

  void goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/sign-up');
  }
}
