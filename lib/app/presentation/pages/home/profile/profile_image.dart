import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  final imgUrl =
      'https://media.istockphoto.com/id/1338134319/photo/portrait-of-young-indian-businesswoman-or-school-teacher-pose-indoors.jpg?s=612x612&w=0&k=20&c=Dw1nKFtnU_Bfm2I3OPQxBmSKe9NtSzux6bHqa9lVZ7A=';

  @override
  Widget build(BuildContext context) {
    const size = 120.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
          ),
          Positioned(
            bottom: -2,
            right: 8,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              width: 34,
              height: 34,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.edit),
                color: Colors.white,
                iconSize: 18,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
