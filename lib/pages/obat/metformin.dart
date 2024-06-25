import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/obat/dashboard_obat.dart';

class MetforminScreen extends StatefulWidget {
  const MetforminScreen({Key? key}) : super(key: key);

  @override
  State<MetforminScreen> createState() => _MetforminScreenState();
}

class _MetforminScreenState extends State<MetforminScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B636E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
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
      body: _buildBody(
          context), // Menggunakan _buildBody dengan parameter context
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const Positioned(
          top: 23,
          left: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //Nama Obat
            children: [
              Text(
                "Metformin",
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
            padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            //Field Deskripsi Obat
            child: const Text(
              "Metformin adalah obat untuk mengendalikan kadar gula darah pada penderita diabetes tipe 2. Jika kadar gula darah stabil pada batas normal, risiko terjadinya komplikasi akibat diabetes, seperti stroke dan penyakit jantung, bisa ditekan. ",
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
            child: Column(
              children: [
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 250, top: 20),
                    child: Center(
                      //Field Bentuk Obat
                      child: Text(
                        'Tablet',
                        style: TextStyle(
                            fontFamily: 'Nunito-Regular',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 330,
          child: Container(
            width: screenWidth - 260,
            height: 40,
            margin: const EdgeInsets.only(top: 100, left: 40),
            decoration: BoxDecoration(
              color: const Color(0xFF61B296),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              //Judul Bentuk Obat
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
            child: Column(
              children: [
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Center(
                      //Field Aturan Pakai
                      child: Text(
                        'Metformin bekerja dengan cara meningkatkan aktivitas hormon insulin, mengurangi pembentukan gula darah di dalam hati, dan menurunkan penyerapan gula di dalam usus. ',
                        style: TextStyle(
                            fontFamily: 'Nunito-Regular',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 450,
          child: Container(
            width: screenWidth - 260,
            height: 40,
            margin: const EdgeInsets.only(top: 100, left: 40),
            decoration: BoxDecoration(
              color: const Color(0xFF61B296),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              //Judul Aturan Pakai
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
