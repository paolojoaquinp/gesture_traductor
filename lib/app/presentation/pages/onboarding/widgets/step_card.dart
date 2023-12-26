import 'package:flutter/material.dart';
import 'package:flutter_with_mediapipe_1/constants/colors.dart' as colors;


class StepCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const StepCard({
    required this.title,
    required this.description,
    required this.imagePath,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.primaryPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white, 
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(38),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 150,
                  child: Image.asset(imagePath,fit: BoxFit.cover,),
                ),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                        child: Text(title, textAlign: TextAlign.center,style:const TextStyle(color: colors.darkPurple,fontSize: 32, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                        child: Text(description,style:const TextStyle(color: colors.darkPurple), textAlign: TextAlign.center, )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}