import 'package:flutter/material.dart';
import 'package:pkl_satunadi/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Delay to navigate the screen automatically
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 40,
              child: Image.asset(
                "assets/images/telkom.png",
                width: size.width - 285,
              ),
            ),
            Positioned(
              top: 170,
              child: Image.asset(
                "assets/images/icon-1.png",
                width: size.width - 90,
              ),
            ),
            Positioned(
              top: 310,
              child: Image.asset(
                "assets/images/doctor_splash.png",
                width: size.width - 150,
              ),
            ),
            Positioned(
              top: 600,
              child: Image.asset(
                "assets/images/logo_satunadi.png",
                width: size.width - 210,
              ),
            ),
            Positioned(
              top: 665,
              child: Image.asset(
                "assets/images/leap.png",
                width: size.width - 295,
              ),
            ),
            Positioned(
              top: 695,
              child: Image.asset(
                "assets/images/bumn.png",
                width: size.width - 240,
              ),
            ),
          ],
        )));
  }
}
