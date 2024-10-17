import 'usuario.dart';

class MenuOption {
  final String value;
  final String label;
  final Usuario usuario; // Parámetro adicional

  MenuOption({required this.value, required this.label, required this.usuario});
}
