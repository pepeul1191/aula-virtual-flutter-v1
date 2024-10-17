class UsuarioLogueado {
  int usuarioId;
  String usuario;
  String nombre;
  int codigo;
  String imagen;
  String correo;
  String tipo;

  UsuarioLogueado({
    required this.usuarioId,
    required this.usuario,
    required this.nombre,
    required this.codigo,
    required this.imagen,
    required this.correo,
    required this.tipo,
  });

  // Método para convertir la instancia a un Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'usuario_id': usuarioId,
      'usuario': usuario,
      'nombre': nombre,
      'codigo': codigo,
      'imagen': imagen,
      'correo': correo,
      'tipo': tipo,
    };
  }

  // Método para crear una instancia de UsuarioLogueado a partir de un Map
  factory UsuarioLogueado.fromMap(Map<String, dynamic> map) {
    return UsuarioLogueado(
      usuarioId: map['usuario_id'],
      usuario: map['usuario'],
      nombre: map['nombre'],
      codigo: map['codigo'],
      imagen: map['imagen'],
      correo: map['correo'],
      tipo: map['tipo'],
    );
  }

  // Método toString para representar la clase como un String
  @override
  String toString() {
    return 'UsuarioLogueado{usuarioId: $usuarioId, usuario: $usuario, nombre: $nombre, codigo: $codigo, imagen: $imagen, correo: $correo, tipo: $tipo}';
  }
}
