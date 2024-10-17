import 'package:aula/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/usuario.dart';
import '../../models/usuario_logueado.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final UsuarioLogueado usuarioLogueado;
  ProfileController control = Get.put(ProfileController());

  ProfilePage({required this.usuarioLogueado});

  Widget _buildBody(BuildContext context) {
    //return SafeArea(child: Text('Template Page + ${usuario.correo}'));
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50, // Ajusta el tamaño del avatar
            backgroundImage: NetworkImage(BASE_URL +
                control.usuarioLogueado.value
                    .imagen), // Asumiendo que 'imagen' es una URL
            child: control.usuarioLogueado.value.imagen.isEmpty
                ? Icon(Icons.person,
                    size: 50) // Icono de reserva si no hay imagen
                : null,
          ),
          Text('Usuario ID: ${control.usuarioLogueado.value.usuarioId}'),
          Text('Nombre: ${control.usuarioLogueado.value.nombre}'),
          Text('Correo: ${control.usuarioLogueado.value.correo}'),
          // Agrega más información según tu modelo
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.control.usuarioLogueado.value = this.usuarioLogueado;
    print(this.control.usuarioLogueado);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: _buildBody(context),
      ),
    );
  }
}
