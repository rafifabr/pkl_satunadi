import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/dokter_umum_screen.dart';

class JenisPembayaran extends StatelessWidget {
  final String poliklinik;
  final DateTime selectedDate;
  String? selectedPaymentMethod;

  JenisPembayaran({
    Key? key,
    required this.poliklinik,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Metode Pembayaran',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Colors.black,
          ),
          textAlign: TextAlign.center, // Center align text
        ),
        centerTitle: true, // Center the title
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Background color
            Positioned.fill(
              child: Container(
                color: Color(0xFF3B636E),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                padding: EdgeInsets.all(2),
                width: screenWidth,
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
                          selectedPaymentMethod = value;
                        },
                        decoration: const InputDecoration(
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
            // Button
            Positioned(
              bottom: 50,
              left: 30,
              right: 30,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedPaymentMethod != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorsUmumScreen(
                          poliklinik: poliklinik,
                          metodePembayaran: selectedPaymentMethod!,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Peringatan'),
                          content: Text(
                              'Silakan pilih metode pembayaran terlebih dahulu.'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  elevation: 20,
                  shadowColor: Colors.black,
                  minimumSize: Size.fromHeight(45),
                  backgroundColor: Color(0xFF3E69FE),
                ),
                child: Text(
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
