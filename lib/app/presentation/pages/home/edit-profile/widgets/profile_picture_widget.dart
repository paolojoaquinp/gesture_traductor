import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'https://media.istockphoto.com/id/1338134319/photo/portrait-of-young-indian-businesswoman-or-school-teacher-pose-indoors.jpg?s=612x612&w=0&k=20&c=Dw1nKFtnU_Bfm2I3OPQxBmSKe9NtSzux6bHqa9lVZ7A='),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // funcion para la img
              },
            ),
          ),
        ],
      ),
    );
  }
}
