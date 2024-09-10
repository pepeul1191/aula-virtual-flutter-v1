import 'dart:convert';
/*
crear una clase llamada SeccionDocenteCurso que tenga los siguiente atributos:
id: INT
codigo: INT
diploma: String
fecha_inicio DATE
fecha_fin DATE
docente_id INT
courso_id INT
ademas genera los siguientes metodos:
toString
constructor vacio
toJSON
fromMap
*/

class SeccionDocenteCurso {
  // Atributos de la clase
  int id;
  int codigo;
  String diploma;
  DateTime fechaInicio;
  DateTime fechaFin;
  int docenteId;
  String docenteNombre;
  int cursoId;
  String cursoNombre;
  String cursoDescripcion;
  String cursoImagen;
  int seccionId;
  int seccionCodigo;

  // Constructor vacío
  SeccionDocenteCurso({
    required this.id,
    required this.codigo,
    required this.diploma,
    required this.fechaInicio,
    required this.fechaFin,
    required this.docenteId,
    required this.cursoId,
    required this.docenteNombre,
    required this.cursoNombre,
    required this.cursoDescripcion,
    required this.cursoImagen,
    required this.seccionId,
    required this.seccionCodigo,
  });

  // Método toString
  @override
  String toString() {
    return 'SeccionDocenteCurso{id: $id, codigo: $codigo, diploma: $diploma, '
        'fechaInicio: $fechaInicio, fechaFin: $fechaFin, docenteId: $docenteId, '
        'docenteNombre: $docenteNombre, cursoId: $cursoId, '
        'cursoNombre: $cursoNombre, cursoDescripcion: $cursoDescripcion, cursoImagen: $cursoImagen,'
        'seccionId: $seccionId, seccionCodigo: $seccionCodigo';
  }

  // Método toJSON
  String toJSON() {
    final map = {
      'id': id,
      'codigo': codigo,
      'diploma': diploma,
      'fecha_inicio': fechaInicio?.toIso8601String(),
      'fecha_fin': fechaFin?.toIso8601String(),
      'docente_id': docenteId,
      'docente_nombre': docenteNombre,
      'curso_id': cursoId,
      'curso_nombre': cursoNombre,
      'curso_descripcion': cursoDescripcion,
      'curso_imagen': cursoImagen,
      'seccion_id': seccionId,
      'seccion_codigo': seccionCodigo,
    };
    return jsonEncode(map);
  }

  // Método fromMap
  factory SeccionDocenteCurso.fromMap(Map<String, dynamic> map) {
    return SeccionDocenteCurso(
        id: map['id'] as int,
        codigo: map['codigo'] as int,
        diploma: map['diploma'] as String,
        fechaInicio: DateTime.parse(map['fecha_inicio'] as String),
        fechaFin: DateTime.parse(map['fecha_fin'] as String),
        docenteId: map['docente_id'] as int,
        docenteNombre: map['docente_nombre'] as String,
        cursoId: map['curso_id'] as int,
        cursoNombre: map['curso_nombre'] as String,
        cursoDescripcion: map['curso_descripcion'] as String,
        cursoImagen: map['curso_imagen'] as String,
        seccionId: map['seccion_id'] as int,
        seccionCodigo: map['seccion_codigo'] as int);
  }

  String generateStatus() {
    DateTime fechaActual = DateTime.now();
    bool estaEntre =
        fechaActual.isAfter(fechaInicio) && fechaActual.isBefore(fechaFin);
    if (estaEntre) {
      return 'activo';
    } else {
      return 'bloqueado';
    }
  }
}
