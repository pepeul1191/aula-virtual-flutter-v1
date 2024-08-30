import 'package:aula/configs/app_colors.dart';
import 'package:aula/configs/constants.dart';
import 'package:flutter/material.dart';
import 'tag.dart';

// Componente reutilizable CustomCard
class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String teacher;
  final String? status;
  final String? section;
  final String? imageUrl;

  // Constructor
  const CourseCard({
    Key? key,
    required this.title,
    required this.description,
    required this.teacher,
    this.imageUrl,
    this.status,
    this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Card(
          color: AppColors.getBackgroundColor(context),
          shadowColor: AppColors.backgroundColor,
          margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (imageUrl != null) ...[
                Image.network(
                  '${BASE_URL}${imageUrl!}', // URL de la imagen
                  fit: BoxFit
                      .cover, // Ajusta cómo se ajusta la imagen en el contenedor
                  width:
                      MediaQuery.of(context).size.width, // Ancho de la imagen
                  height: 100,
                ), // Altura de la imagen),
              ],
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (section != null)
                      Text(
                        section!,
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.getTextGrayColor(context)),
                      ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      children: [
                        if (status != null) ...[
                          Text('Estado ',
                              style: Theme.of(context).textTheme.labelLarge),
                          Text(
                            '${status!.toUpperCase()}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: status == 'activo'
                                        ? Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.greenAccent
                                            : Colors.green
                                        : status == 'bloqueado'
                                            ? Colors.redAccent
                                            : Colors.blueAccent,
                                    fontWeight: FontWeight
                                        .bold // Color personalizado solo para este Text
                                    ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                        Tag(
                          text: 'Ingeneria de Software',
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.getButtonColor(context),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 8), // Espacio arriba y abajo de la línea
                      height: 1, // Grosor de la línea
                      color: Colors.black, // Color de la línea
                      width: double
                          .infinity, // Ancho de la línea (llena el contenedor)
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Docente: ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight
                                      .normal, // Normal weight for 'Docente:'
                                ),
                          ),
                          TextSpan(
                            text: teacher,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight
                                      .bold, // Bold weight for teacher
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
