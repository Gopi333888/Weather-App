import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/pages/weather_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Lottie.asset("assets/lottie/Animation - 1701961273145.json"),
          ),
          const Text(
            "CloudCanvas",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.black,
      nextScreen: const WeatherPage(),
      splashIconSize: 500,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
