import 'package:flutter/material.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/about_us/about_us_generator.dart';


class AboutUs extends StatefulWidget {

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pagesAboutUs = aboutUsPages;
    return PageView.builder(
      controller: _pageController,
      itemCount: _pagesAboutUs.length,
      itemBuilder: (context, index) {
        return _pagesAboutUs[index];
      },
    );
  }
}