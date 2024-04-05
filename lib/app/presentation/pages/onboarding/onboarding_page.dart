import 'package:flutter/material.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/onboarding/widgets/step_card.dart';
import 'package:flutter_with_mediapipe_1/constants/colors.dart' as colors;

import '../home/home_page.dart';


class OnboardingPage extends StatefulWidget {

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController; // Declare a PageController
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController()  
       ..addListener(() {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      });
  }

  @override
  void dispose() {
    _pageController.removeListener(() {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      });
    _pageController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paddingPage = MediaQuery.of(context).size.width * 0.05;
    final raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: colors.darkPurple,
      minimumSize: const Size(double.infinity, 46),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController, // Assign the PageController to the PageView
              children: [
                const StepCard(
                  title: 'Levanta tu mano',
                  description: 'Encuentra un lugar bien iluminado y haz alguno de los gestos que se muestran.',
                  imagePath: 'assets/images/onboarding-1.png'
                ),
                const StepCard(
                  title: 'Enfocate con la camara',
                  description: 'Enfoca tu mano izquierda en el cuadro de la camara haciendo el gesto.',
                  imagePath: 'assets/images/onboarding-2.png'
                ),
                const StepCard(
                  title: 'Hazte Escuchar',
                  description: 'Esta aplicacion es para facilitar la comunicacion con personas con discapacidad auditiva.',
                  imagePath: 'assets/images/onboarding-3.png' 
                ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: paddingPage), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: raisedButtonStyle,
                    child:  Text(_currentPage == 2 ? 'Entiendo' : 'Siguiente'),
                    onPressed: () {
                      if(_currentPage == 2) {        
                        Navigator.pushAndRemoveUntil(context, 
                          MaterialPageRoute(builder: (_) => const HomePage()),
                          (route) => false
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextButton(
                    child: const Text('Skip',style: TextStyle(color: colors.darkPurple)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, 
                        MaterialPageRoute(builder: (_) => const HomePage()),
                        (route) => false
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

