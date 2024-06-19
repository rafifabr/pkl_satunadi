import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:pkl_satunadi/pages/obat/dashboard_obat.dart';
// import 'package:mojadiapp/alpes.dart';

class AcarboseScreen extends StatefulWidget {
  const AcarboseScreen({Key? key}) : super(key: key);

  @override
  State<AcarboseScreen> createState() => _AcarboseScreenState();
}

class _AcarboseScreenState extends State<AcarboseScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B636E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ObatScreen()),
            );
          },
        ),
        title: const Text(
          'Informasi Obat',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildBody(context), // Menggunakan _buildBody dengan parameter context
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 23,
          left: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Acarbose",
                textAlign: TextAlign.start,
                style: TextStyle(
                fontSize: 48,
                fontFamily: 'Nunito-Bold',
                fontWeight: FontWeight.w600,
                color: Colors.black,
                  ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 115,
          left: 28,
          right: 28,
          child: Container(
            height: 285, 
            padding: EdgeInsets.only(left: 20, top: 5, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                "Acarbose atau akarbose adalah obat golongan antidiabetes. Obat ini bekerja dengan cara memperlambat pemecahan karbohidrat dalam makan menjadi gula, sehingga kadar gula darah tidak naik drastis setelah makan.\n\nAcarbose digunakan untuk mengobati diabetes tipe 2, yaitu kondisi di mana tubuh tidak dapat menggunakan insulin secara normal sehingga menyebabkan kenaikan gula darah. ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Nunito-Regular',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),

                    Positioned(
              top: 300,
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
                    //Deskripsi Dokter
                    Container(
                      width: screenWidth - 60,
                      height: 70,
                      margin: const EdgeInsets.only(top: 150, left: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                            ),
                          ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 250, top: 20),
                        child: Center(
                          child: Text(
                            'Tablet',
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
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
              top: 330,
              child: Container(
                width: screenWidth - 260,
                height: 40,
                margin: const EdgeInsets.only(top: 100, left: 40),
                decoration: BoxDecoration(
                  color: Color(0xFF61B296),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Bentuk Obat',
                    style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 475,
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
                      height: 160,
                      margin: const EdgeInsets.only(top: 100, left: 31),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                            ),
                          ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Center(
                          child: Text(
                            'Dosis awal acarbose untuk orang dewasa adalah 25–50 mg 3 kali sehari. Jika diperlukan, dosis dapat ditingkatkan menjadi 100–200 mg 3 kali sehari setelah 4–8 minggu.',
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
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
              top: 450,
              child: Container(
                width: screenWidth - 260,
                height: 40,
                margin: const EdgeInsets.only(top: 100, left: 40),
                decoration: BoxDecoration(
                  color: Color(0xFF61B296),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Aturan Pakai',
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
      ],
    );
  }
}