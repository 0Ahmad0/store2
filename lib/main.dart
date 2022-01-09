import 'package:flutter/material.dart';
import 'package:reham_1/constants/colors.dart';
import 'package:reham_1/screens/add_and_edit_screen.dart';
import 'package:reham_1/screens/details_screen.dart';
import 'package:reham_1/screens/login_screen.dart';
import 'package:reham_1/screens/register_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'screens/home_screen.dart';
import 'screens/profile_Screen.dart';

void main() {
  runApp(const MyApp());
}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xffe3e3e6,
    const <int, Color>{
      50: const Color(0xffc7e666),//10%
    },
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
         primarySwatch: Colors.green,
      ),

      home: SplashScreenView(
        navigateRoute: HomeScreen(),
        duration: 4000,
        imageSize: 200,
        imageSrc: "images/logo.png",
        text: 'App Name',
        textType: TextType.ColorizeAnimationText,
        colors: [
          Colors.green,
          primaryColor
        ],
      )
    );
  }
}

