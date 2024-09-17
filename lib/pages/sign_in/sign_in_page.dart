import 'package:aula/components/large_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Text('Ingresar al sistema'),
        TextField(
            controller: control.txtUsuario,
            decoration: InputDecoration(
              labelText: 'Usuario',
              //suffixIcon: Icon(Icons.search), // Icono a la derecha
              border: OutlineInputBorder(), // Borde del TextField
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0), // Espaciado interno
            )),
        TextField(
            controller: control.txtContrasenia,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              //suffixIcon: Icon(Icons.search), // Icono a la derecha
              border: OutlineInputBorder(), // Borde del TextField
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0), // Espaciado interno
            )),
        Obx(() {
          return Text(control.mensaje.value);
        }),
        LargeButton(
            title: 'Ingresar',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(14),
            onPressed: () {
              control.signIn(context);
            }),
        LargeButton(
            title: 'Ir Crear Cuenta',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(14),
            onPressed: () {
              control.goToSignUp(context);
            })
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    ));
  }
}
