/*
prompt chatgpt: quiero una clase en dart llamada Usuario, que tenga como atributos un idUsuario entero y un correo como String. Adiconalmente, quiero que la clase tenga el metodo toString, toJson y fromMap
 */

class Usuario {
  int? id;
  String usuario;
  String? contrasenia;

  Usuario({this.id, required this.usuario, required this.contrasenia});

  // Método toString para representar la clase como un String
  @override
  String toString() {
    return 'Usuario{idUsuario: $id, usuario: $usuario, contraseña: $contrasenia}';
  }

  // Método para convertir la instancia a un Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'usuario': usuario,
      'contrasenia': contrasenia,
    };
  }

  // Método para crear una instancia de Usuario a partir de un Map
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      usuario: map['usuario'],
      contrasenia: map['contrasenia'],
    );
  }
}
