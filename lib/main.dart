import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/camera/bloc/camera_bloc.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/onboarding/onboarding_page.dart';

import 'app/presentation/pages/home/home_page.dart';
import 'app/data/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraBloC(),
      child: ScreenUtilInit(
          builder: (context , child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Traductor de señas',
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    elevation: 0.0,
                    color: Colors.transparent,
                  ),
                ),
                home: OnboardingPage(),
              );
          }),
    );
  }
}
