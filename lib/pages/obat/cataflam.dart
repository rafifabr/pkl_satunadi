import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/obat/dashboard_obat.dart';

class CataflamScreen extends StatefulWidget {
  const CataflamScreen({Key? key}) : super(key: key);

  @override
  State<CataflamScreen> createState() => _CataflamScreenState();
}

class _CataflamScreenState extends State<CataflamScreen> {
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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        const Positioned(
          top: 23,
          left: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cataflam",
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
            padding:
                const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 20),
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
            child: const Text(
              "Cataflam adalah obat yang bermanfaat untuk meredakan gejala nyeri dan radang sendi akibat rheumatoid arthritis, osteoarthritis, atau spondilitis ankilosa. Obat ini juga bisa digunakan untuk nyeri haid, migrain, atau nyeri setelah operasi.",
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
          child: Column(
            children: [
              Container(
                width: screenWidth - 60,
                height: 60,
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
                    child: Text(
                      'Cair',
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              )
            ],
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
          child: Column(
            children: [
              Container(
                width: screenWidth - 60,
                height: 80,
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
                    child: Text(
                      'Cataflam dapat dikonsumsi sebelum atau sesudah makan, tetapi lebih baik sebelum makan. Untuk Cataflam Tablet, konsumsi obat dengan bantuan air putih. Jangan menghancurkan atau mengunyah tablet.',
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              )
            ],
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
