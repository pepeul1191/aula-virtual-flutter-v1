import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/service_http_response.dart';
import '../../models/usuario.dart';
import '../../models/usuario_logueado.dart';
import '../../services/usuario_service.dart';

class ProfileController extends GetxController {
  Rx<File?> pickedImageFile = File('').obs;

  var usuarioLogueado = UsuarioLogueado(
          usuarioId: 0,
          usuario: '',
          nombre: '',
          codigo: 0,
          imagen: '',
          correo: '',
          tipo: '',
          personaId: 0)
      .obs;

  void takePicture() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // Acción con la imagen capturada (p.ej. mostrarla en un widget)
      int usuarioId = usuarioLogueado.value.usuarioId;
      print(
          'Control: Imagen seleccionada desde la cámara: ${pickedImage.path}');
      pickedImageFile.value = File(pickedImage.path);
      updateImage(usuarioId);
      //closeBottomSheet(context);
    }
  }

  void updateImage(int usuarioId) async {
    UsuarioService service = UsuarioService();
    ServiceHttpResponse? response = await service.updateProfileImage(
        pickedImageFile.value!.path, usuarioId);
    print(response!.body);
  }

  void pickImageFromGallery() async {
    print('ppppppppppppp');
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Acción con la imagen seleccionada (p.ej. mostrarla en un widget)
      print(
          'Control: Imagen seleccionada desde la galería: ${pickedImage.path}');
      pickedImageFile.value = File(pickedImage.path);
      updateImage(usuarioLogueado.value.usuarioId);
    }
  }
  /*
  var usuario = Usuario(idUsuario: 0, correo: '').obs;

  void updateUsuario(Usuario u) {
    usuario.update((val) {
      val?.idUsuario = u.idUsuario;
      val?.correo = u.correo;
    });
  }
  */
}
