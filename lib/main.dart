// ignore_for_file: unnecessary_type_check

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:origami/bussinus_logic/authentication.dart';
import 'package:origami/screens/home_screen.dart';

import 'package:origami/screens/login_screen.dart';
import 'package:origami/screens/register_screen.dart';
import 'package:origami/screens/splah_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Origami());
}

class Origami extends StatelessWidget {
  const Origami({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(360, 690),
      child: CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: SplashScreen(
          nextScreen: FutureBuilder<bool>(
              future: checkLoginStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show loading indicator or splash screen while checking login status
                  return CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    // Handle error
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Navigate to home or login screen based on login status
                    return snapshot.data == true
                        ? const HomeScreen()
                        : const LoginScreen();
                  }
                }
              }),
          routes: {
            'loginpage': (context) => const LoginScreen(),
            'registerpage': (context) => const RegisterScreen(),
            'homepage': (context) => const HomeScreen(),
          },
        ));
  }
}
