import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/appointment_calendar_screen';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorDetailPage(),
    );
  }
}

class DoctorDetailPage extends StatelessWidget {
  const DoctorDetailPage({super.key});

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
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Deskripsi Dokter
                    Container(
                      width: screenWidth - 60,
                      height: 115,
                      margin: const EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Center(
                          child: Text(
                            'dr. John Doe adalah dokter umum di Rumah Sakit SatuNadi.',
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),

            //Tentang Saya
            Positioned(
              top: 300,
              child: Container(
                width: screenWidth - 240,
                height: 40,
                margin: const EdgeInsets.only(top: 100, left: 50),
                decoration: BoxDecoration(
                  color: Color(0xFF61B296),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Tentang Saya',
                    style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 500,
              child: Container(
                // padding: EdgeInsets.all(2),
                // width: screenWidth,
                // height: MediaQuery.of(context).size.height,
                // decoration: BoxDecoration(
                //   color: Color(0xFF3B636E),
                //   borderRadius: BorderRadius.circular(80),
                // ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Jam Jadwal Praktik
                    Container(
                      width: screenWidth - 60,
                      height: 65,
                      margin: const EdgeInsets.only(top: 100, left: 31),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Center(
                          child: Text(
                            'Senin - Jumat, 10:00 - 15:00',
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),

            //Jadwal Praktik
            Positioned(
              top: 480,
              child: Container(
                width: screenWidth - 240,
                height: 40,
                margin: const EdgeInsets.only(top: 100, left: 50),
                decoration: BoxDecoration(
                  color: Color(0xFF61B296),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Jadwal Praktik',
                    style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
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
            //Button
            Positioned(
              bottom: 50,
              left: 30,
              right: 30,
              child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentCalendarScreen()),
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
                "Buat Janji Temu",
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