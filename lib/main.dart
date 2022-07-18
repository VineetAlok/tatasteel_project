import 'package:flutter/material.dart';
import 'package:tatasteel_project/generator.dart';
import 'package:tatasteel_project/homepage.dart';
import 'package:tatasteel_project/login.dart';
import 'package:tatasteel_project/register.dart';
import 'package:tatasteel_project/generator.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashscreen(),
    routes: {
      'generator': (context) => generator(),
      'register': (context) => MyRegister(),
      'homepage': (context) => homepage(),
      'login': (context) => MyLogin(),
    },
  ));
}

class splashscreen extends StatelessWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/loadingscreen.json'),
        splashIconSize: 300,
        backgroundColor: Colors.white,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: const Duration(seconds: 1),
        nextScreen: MyLogin());
  }
}
