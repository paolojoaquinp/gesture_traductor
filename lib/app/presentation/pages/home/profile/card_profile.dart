import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_image.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: const Offset(0, -16),
            child: const ProfileImage(),
          ),
          Text(
            'Sushma Tamrakar',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'UI/UX Designer',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Divider(color: Colors.transparent),
        ],
      ),
    );
  }
}
