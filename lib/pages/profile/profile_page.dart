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
          Stack(
            children: [
              control.pickedImageFile.value!.path == ''
                  ? CircleAvatar(
                      radius: 50, // Ajusta el tamaño del avatar
                      backgroundImage: NetworkImage(BASE_URL +
                          control.usuarioLogueado.value
                              .imagen), // Asumiendo que 'imagen' es una URL
                      child: control.usuarioLogueado.value.imagen.isEmpty
                          ? Icon(
                              Icons.person,
                              size: 50,
                            ) // Icono de reserva si no hay imagen
                          : null,
                    )
                  : Obx(() => ClipOval(
                        child: Container(
                          width: 100.0, // El diámetro del círculo (2 * radius)
                          height: 100.0, // El diámetro del círculo (2 * radius)
                          child: control.pickedImageFile.value != null
                              ? Image.file(
                                  control.pickedImageFile.value!,
                                  fit: BoxFit
                                      .cover, // Asegura que la imagen llene el círculo
                                )
                              : Icon(Icons.person,
                                  size: 50), // Icono si no hay imagen
                        ),
                      )),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    // Lógica para cambiar la imagen de perfil (puedes usar el image_picker aquí)
                    print('Icono de lápiz presionado 2');
                    //control.takePicture();
                    control.pickImageFromGallery();
                    // Puedes llamar a tu lógica aquí para mostrar el picker o realizar otra acción
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.edit, // Icono de lápiz
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
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
