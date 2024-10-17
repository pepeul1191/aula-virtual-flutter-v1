import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/large_button.dart';
import 'reset_controller.dart';

class ResetPage extends StatelessWidget {
  ResetController control = Get.put(ResetController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Column(children: [
          Text('Restablecer Contraseña'),
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
          Text(control.mensaje.value),
          LargeButton(
              title: 'Ingresar',
              backgroundColor: control.enabled.value ? Colors.red : Colors.grey,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                control.signIn(context);
              }),
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
