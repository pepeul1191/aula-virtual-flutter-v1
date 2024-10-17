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
  String diploma;
  DateTime fechaInicio;
  DateTime fechaFin;
  int docenteId;
  String docenteNombre;
  int cursoId;
  String cursoNombre;
  String cursoDescripcion;
  String cursoImagen;
  int cursoCodigo;
  int seccionId;
  int seccionCodigo;

  // Constructor vacío
  SeccionDocenteCurso({
    required this.diploma,
    required this.fechaInicio,
    required this.fechaFin,
    required this.docenteId,
    required this.cursoId,
    required this.docenteNombre,
    required this.cursoNombre,
    required this.cursoDescripcion,
    required this.cursoImagen,
    required this.cursoCodigo,
    required this.seccionId,
    required this.seccionCodigo,
  });

  // Método toString
  @override
  String toString() {
    return 'SeccionDocenteCurso{diploma: $diploma, '
        'fechaInicio: $fechaInicio, fechaFin: $fechaFin, docenteId: $docenteId, '
        'docenteNombre: $docenteNombre, cursoId: $cursoId, '
        'cursoNombre: $cursoNombre, cursoDescripcion: $cursoDescripcion, cursoCodigo: $cursoCodigo, '
        'cursoImagen: $cursoImagen,seccionId: $seccionId, seccionCodigo: $seccionCodigo';
  }

  // Método toJSON
  String toJSON() {
    final map = {
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

  //{"docente_id":1,"docente_nombre":"VALDIVIA CABALLERO, JOSE JESÚS","curso_id":1,"curso_codigo":213213,"curso_nombre":"Progrmación Móvil","curso_descripcion":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.","curso_imagen":"assest/img/curso01.png","seccion_id":1,"seccion_codigo":423,"fecha_inicio":"2024-08-01 00:00:00 -0500","fecha_fin":"2024-12-25 00:00:00 -0500","diploma":"assets/pdf/pm.pdf"}
  factory SeccionDocenteCurso.fromMap(Map<String, dynamic> map) {
    return SeccionDocenteCurso(
        docenteId: map['docente_id'] as int,
        cursoId: map['curso_id'] as int,
        cursoCodigo: map['curso_codigo'] as int,
        diploma: map['diploma'] as String,
        fechaInicio: DateTime.parse(map['fecha_inicio'] as String),
        fechaFin: DateTime.parse(map['fecha_fin'] as String),
        docenteNombre: map['docente_nombre'] as String,
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
