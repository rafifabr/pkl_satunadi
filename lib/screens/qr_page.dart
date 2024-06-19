import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRPage(),
    );
  }
}

class QRPage extends StatelessWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B636E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tunjukkan kode QR ini kepada petugas sebagai tanda bahwa anda sudah hadir',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Nunito-Bold',
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 65),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(10),
              ),
              child: QrImageView(
                data: 'https://www.figma.com/file/jYZaMwfi8GPlqW2ggUOZRp/SATUNADI?type=design&node-id=473-3377&mode=design&t=iTPdoFyARXV66rBj-0',
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 20,
                shadowColor: Colors.black,
                minimumSize: const Size(350, 45),
                backgroundColor: const Color(0xFF3E69FE),
              ),
              child: const Text(
                "Kembali",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Nunito-Bold',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
