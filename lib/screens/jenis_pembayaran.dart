import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/dokter_umum.dart';
import 'package:pkl_satunadi/screens/dokter_umum_screen.dart';
import 'package:pkl_satunadi/screens/resume_rsvp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JenisPembayaran(),
    );
  }
}

class JenisPembayaran extends StatelessWidget {
  String? selectedPaymentMethod;

  JenisPembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Foto dokter
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/doctor1.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Tombol back
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF3B636E)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            // Container di bawah foto dokter
            Positioned(
              top: 315,
              child: Container(
                padding: EdgeInsets.all(2),
                width: screenWidth,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xFF3B636E),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Silakan Pilih Metode Pembayaran',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      DropdownButtonFormField<String>(
                        value: selectedPaymentMethod,
                        items: [
                          DropdownMenuItem(
                            value: 'BPJS',
                            child: Text('BPJS'),
                          ),
                          DropdownMenuItem(
                            value: 'Pribadi',
                            child: Text('Pribadi'),
                          ),
                          DropdownMenuItem(
                            value: 'Asuransi',
                            child: Text('Asuransi'),
                          ),
                        ],
                        onChanged: (value) {
                          // Handle the selected value
                          selectedPaymentMethod = value as String;
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Metode Pembayaran',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
            ),

            // Container info dokter
            Positioned(
              top: 260,
              left: 50,
              right: 50,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFDFA),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nama dokter
                    Text(
                      'dr. John Doe',
                      style: TextStyle(
                        fontFamily: 'Nunito-Bold',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Keterangan dr umum
                    Text(
                      'Dokter Umum',
                      style: TextStyle(
                        fontFamily: 'Nunito-Bold',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Button
            Positioned(
              bottom: 50,
              left: 30,
              right: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorsUmumScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 20,
                  shadowColor: Colors.black,
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor: const Color(0xFF3E69FE),
                ),
                child: const Text(
                  "Konfirmasi",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito-Bold',
                    color: Colors.white,
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
