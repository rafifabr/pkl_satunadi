import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String userName = user?.displayName ?? 'User';

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background_dashboard.jpg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                color: Colors.white,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang, \n$userName',
                          style: const TextStyle(
                            color: Color(0xff053A32),
                            fontFamily: 'Nunito-Bold',
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          'Jaga kesehatan, ya!',
                          style: TextStyle(
                            color: Color(0xff053A32),
                            fontFamily: 'Nunito-Regular',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/doctor.png",
                      width: 120,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Mengatur lebar sesuai lebar layar
                child: Card(
                  color: const Color(0xFF3B636E),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildRichText(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDashboardButton(
                              text: 'E-Reservasi',
                              onPressed: () {},
                            ),
                            _buildDashboardButton(
                              text: 'Informasi Obat',
                              onPressed: () {},
                            ),
                            _buildDashboardButton(
                              text: 'Rekam Medis',
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Artikel Menarik Hari Ini',
                          style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontSize: 18,
                            color: Color(0xFF053A32),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Baca Artikel'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRichText() {
    return RichText(
      text: const TextSpan(
        text: 'Silakan masuk dengan melengkapi informasi di bawah ini',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Nunito-Regular',
          color: Color(0xFF053A32),
        ),
      ),
    );
  }

  Widget _buildDashboardButton(
      {required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: LoginPage(),
    ),
  );
}
