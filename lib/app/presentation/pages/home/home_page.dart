import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/about_us/about_us.dart';
import 'package:flutter_with_mediapipe_1/constants/colors.dart' as colors;


import '../../../../generated/l10n.dart';
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
          // HomePage -> ModalPreview
          _ModelPreview(
            currentPageValue: _currentPageValue,
          ),
          AboutUs(),
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
            icon:  Icon(Icons.home, color: colors.primaryPurple),
            label:"Home"
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
