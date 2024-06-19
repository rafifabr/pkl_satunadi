import 'package:flutter/material.dart';
import 'package:pkl_satunadi/login_page.dart';
import 'package:pkl_satunadi/signup_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const double buttonWidthFactor = 0.5;
    const double buttonHeight = 10.0;
    const double buttonFontSize = 22.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo_satunadi.png", width: size.width - 90),
            SizedBox(height: 100),

            // Tombol Login
            FractionallySizedBox(
              widthFactor: buttonWidthFactor,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: buttonHeight), backgroundColor: Color(0xFF61B297),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito-Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: buttonFontSize,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Tombol Sign Up
            FractionallySizedBox(
              widthFactor: buttonWidthFactor,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()), // Navigasi ke halaman sign up
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: buttonHeight),
                  backgroundColor: const Color(0xFF3B636E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito-Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: buttonFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
