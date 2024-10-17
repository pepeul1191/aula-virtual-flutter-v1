import 'package:aula/components/large_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Column(children: [
          Text('Ingresar al sistema'),
          TextField(
              controller: control.txtUsuario,
              decoration: InputDecoration(
                labelText: 'Usuario',
                //suffixIcon: Icon(Icons.search), // Icono a la derecha
                border: OutlineInputBorder(), // Borde del TextField
                enabled: control.enabled.value,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0), // Espaciado interno
              )),
          TextField(
              controller: control.txtContrasenia,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                //suffixIcon: Icon(Icons.search), // Icono a la derecha
                border: OutlineInputBorder(), // Borde del TextField
                enabled: control.enabled.value,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0), // Espaciado interno
              )),
          Text(control.mensaje.value),
          LargeButton(
              title: 'Ingresar',
              backgroundColor: control.enabled.value ? Colors.red : Colors.grey,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                control.signIn(context);
              }),
          LargeButton(
              title: 'Ir Crear Cuenta',
              backgroundColor: control.enabled.value ? Colors.red : Colors.grey,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                control.goToSignUp(context);
              })
        ]);
      }),
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
