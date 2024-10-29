import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/large_button.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpController control = Get.put(SignUpController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Column(children: [
          Text('Crear Cuenta'),
          TextField(
              controller: control.txtCorreo,
              decoration: InputDecoration(
                labelText: 'Correo',
                //suffixIcon: Icon(Icons.search), // Icono a la derecha
                border: OutlineInputBorder(), // Borde del TextField
                enabled: control.enabled.value,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0), // Espaciado interno
              )),
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
          TextField(
              controller: control.txtContrasenia2,
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
              title: 'Crear cuenta',
              backgroundColor: control.enabled.value ? Colors.red : Colors.grey,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                control.signUp(context);
              }),
          LargeButton(
              title: 'Ir a Login',
              backgroundColor: control.enabled.value ? Colors.red : Colors.grey,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                control.goToSignIn(context);
              }),
          LargeButton(
              title: 'Resetar Contraseña',
              backgroundColor: control.enabled.value ? Colors.red : Colors.grey,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                control.goToResetPassword(context);
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
