import 'package:get/get.dart';

import '../../models/usuario.dart';
import '../../models/usuario_logueado.dart';

class ProfileController extends GetxController {
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
