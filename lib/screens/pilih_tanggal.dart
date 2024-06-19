import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/jenis_pembayaran.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PilihTanggalPage(),
    );
  }
}

class PilihTanggalPage extends StatefulWidget {
  const PilihTanggalPage({Key? key});

  @override
  _PilihTanggalPageState createState() => _PilihTanggalPageState();
}

class _PilihTanggalPageState extends State<PilihTanggalPage> {
  DateTime? selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
                child: Column(
                  children: [
                    // Pilih Tanggal Text
                    Padding(
                      padding: const EdgeInsets.only(top: 70, right: 240),
                      child: Text(
                        'Pilih Tanggal',
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    // Additional Text
                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: Text(
                        'Appointment',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
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

            // Button for selecting date
            Positioned(
              bottom: 255,
              left: 30,
              right: 30,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF61B296),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Pilih tanggal",
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Tanggal yang dipilih',
                    style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    selectedDate != null
                        ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                        : 'Belum memilih tanggal',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
                    MaterialPageRoute(builder: (context) => JenisPembayaran()),
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
                  "Selanjutnya",
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
