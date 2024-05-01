import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_with_mediapipe_1/app/data/services/user_preferences.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/camera/bloc/camera_bloc.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/home/home_page.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/onboarding/onboarding_page.dart';

import 'app/data/services/service_locator.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();
    return BlocProvider(
      create: (context) => CameraBloC(),
      child: ScreenUtilInit(
          builder: (context , child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Traductor de señas',
                initialRoute: prefs.defaultRoute,
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    elevation: 0.0,
                    color: Colors.transparent,
                  ),
                ),
                localizationsDelegates: {
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                },
                supportedLocales: S.delegate.supportedLocales,
                routes: {
                  '/onboarding': (context) => OnboardingPage(),
                  '/home': (context) => const HomePage(),
                },
              );
          }),
    );
  }
}
