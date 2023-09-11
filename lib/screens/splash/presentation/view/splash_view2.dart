
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../intro/intro_view.dart';
class MovieSplashView extends StatelessWidget {
  const MovieSplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/images/1.png',fit:BoxFit.fill),
        ),
      ),
      splashIconSize: double.infinity,
      duration: 4000,
      nextScreen: IntroductionPageView(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );


  }
}
