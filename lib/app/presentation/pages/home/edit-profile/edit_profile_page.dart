import 'package:flutter/material.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/home/edit-profile/widgets/input_field_widget.dart'
import 'package:flutter_with_mediapipe_1/app/presentation/pages/home/edit-profile/widgets/profile_picture_widget.dart'
import 'package:flutter_with_mediapipe_1/app/presentation/pages/home/edit-profile/widgets/save_button_widget.dart'

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool newsletter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff5070d5),
                      Color(0xff9d60da),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 226,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kToolbarHeight + 10,
                right: 16,
                left: 16,
              ),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          ProfilePictureWidget(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'About me',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InputFieldWidget(
                              controller: nameController,
                              label: 'Full name',
                              hint: 'Enter your full name'),
                          InputFieldWidget(
                              controller: birthdayController,
                              label: 'Birthday',
                              hint: 'Enter your birthday'),
                          InputFieldWidget(
                              controller: emailController,
                              label: 'E-mail',
                              hint: 'Enter your email'),
                          InputFieldWidget(
                              controller: phoneController,
                              label: 'Phone',
                              hint: 'Enter your phone number'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SaveButtonWidget(
                      onPressed: () {
                        // Acción del botón save
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 60,
              left: 10,
              child: Material(
                color: Colors.transparent,
                shape: CircleBorder(),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 34.0),
                  onPressed: () {
                    // func. para ir atrás
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
