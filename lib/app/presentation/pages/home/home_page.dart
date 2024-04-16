import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_with_mediapipe_1/constants/colors.dart' as colors;

import '../../../../constants/data.dart';
import 'profile/profile_page.dart';
import 'widgets/model_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentPageValue = 2;
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Inicio',
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(28),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _ModelPreview(
            currentPageValue: _currentPageValue,
          ),
          const AboutPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: colors.primaryPurple,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, color: colors.primaryPurple),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.info, color: colors.primaryPurple),
            label: 'Acerca de',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people, color: colors.primaryPurple),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.darkPurple,
      child: const Center(
        child: Text(
          'Texto en construccion - vuelva pronto',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _ModelPreview extends StatelessWidget {
  const _ModelPreview({
    Key? key,
    required this.currentPageValue,
  }) : super(key: key);
  final double currentPageValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(100.0),
        left: ScreenUtil().setWidth(20.0),
        right: ScreenUtil().setWidth(20.0),
      ),
      width: double.infinity,
      color: colors.primaryPurple,
      child: Column(
        children: [
          ModelCard(
            index: currentPageValue.toInt(),
          ),
        ],
      ),
    );
  }
}
