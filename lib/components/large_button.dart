import 'package:aula/configs/colors.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final VoidCallback onPressed;

  const LargeButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ocupa todo el ancho disponible
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: textColor ??
                  AppColors.getTextColor(context), // Color del texto
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ??
                AppColors.getBackgroundColor(context), // Color del texto
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), // Espaciado interno
            textStyle: TextStyle(
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(8), // Ajusta el borde redondeado
            ), // Tamaño del texto
          )),
    );
  }
}
