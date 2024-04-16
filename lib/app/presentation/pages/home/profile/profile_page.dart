import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_options.dart';
import 'card_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff5070d5),
                Color(0xff9d60da),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(64),
              bottomRight: Radius.circular(64),
            ),
          ),
          height: 180.h,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: kToolbarHeight + 52,
            right: 16,
            left: 16,
          ),
          child: Column(
            children: [
              // const SizedBox(),
              const CardProfile(),
              SizedBox(height: 16.h),
              const CardOptions(),
            ],
          ),
        ),
      ],
    );
  }
}
