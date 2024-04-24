import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  final String imagenUrl;
  final Color colorInicio;
  final Color colorFin;
  final String title1;
  final String description1;
  final String title2;
  final String description2;

  const AboutUs({
    Key? key,
    required this.imagenUrl,
    required this.colorInicio,
    required this.colorFin,
    required this.title1,
    required this.description1,
    required this.title2,
    required this.description2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorInicio, colorFin],
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(imagenUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title1,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Caveat', // Fuente
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description1,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Caveat', // Fuente
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title2,
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Caveat', // Fuente
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description2,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Caveat', // Fuente
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
