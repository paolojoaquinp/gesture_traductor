import 'package:flutter/material.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/onboarding/widgets/about_us.dart';

class AboutUsGenerator {
  static List<Widget> generateAboutUsPages() {
    return <Widget>[
      AboutUs(
        imagenUrl:
            'https://inetep.edu.mx/wp-content/uploads/2017/06/manosquehablan.png',
        colorInicio: Colors.purple,
        colorFin: Colors.blue,
        title1: 'ABOUT US',
        description1:
            'Nuestro objetivo es facilitar la comunicación para las personas sordas o con problemas de audición y promover la inclusión',
        title2: 'EQUIPO',
        description2:
            'Nuestro equipo utiliza Flutter y tecnologías avanzadas para desarrollar una aplicación que reconoce y traduce el lenguaje de señas en tiempo real',
      ),
      AboutUs(
        imagenUrl:
            'https://inetep.edu.mx/wp-content/uploads/2017/06/manosquehablan.png',
        colorInicio: Colors.blue,
        colorFin: Colors.purple,
        title1: 'ABOUT US',
        description1:
            'Diseñamos una app móvil que rompe las barreras de comunicación al traducir el lenguaje de señas, con el firme propósito de promover la inclusión',
        title2: 'TECNOLOGIA',
        description2:
            'Nuestra app móvil está dedicada a hacer que la comunicación sea más accesible al traducir el lenguaje de señas, impulsando la inclusión y la conexión entre personas',
      ),
    ];
  }
}
