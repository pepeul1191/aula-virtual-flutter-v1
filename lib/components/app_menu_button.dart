import 'package:flutter/material.dart';

class AppMenuButton extends StatelessWidget {
  final BuildContext context; // Pasar el contexto si es necesario
  final void Function(String) onSelected;

  AppMenuButton({
    required this.context,
    required this.onSelected,
  });

  void _handleSelection(String value) {
    // Puedes manejar la lógica de selección aquí
    switch (value) {
      case 'Item 1':
        // Acción para el primer ítem
        print('Item 1 selected');
        break;
      case 'Item 2':
        // Acción para el segundo ítem
        print('Item 2 selected');
        break;
    }

    // Llama al callback externo si es necesario
    onSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: _handleSelection,
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'edit-profile',
            child: Text('Editar Perfil'),
          ),
          PopupMenuItem<String>(
            value: 'sign-out',
            child: Text('Salir'),
          ),
          // Agrega más items aquí si es necesario
        ];
      },
    );
  }
}
