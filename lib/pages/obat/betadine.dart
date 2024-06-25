import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/obat/dashboard_obat.dart';

class BetadineScreen extends StatefulWidget {
  const BetadineScreen({Key? key}) : super(key: key);

  @override
  State<BetadineScreen> createState() => _BetadineScreenState();
}

class _BetadineScreenState extends State<BetadineScreen> {
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
                "Betadine",
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
              "Betadine adalah produk antiseptik yang bermanfaat untuk mencegah pertumbuhan dan membunuh kuman penyebab infeksi. Obat antiseptik ini tersedia dalam bentuk cairan, salep, semprot, dan stik. Betadine mengandung povidone iodine sebagai bahan aktif utama.",
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
                      'Oleskan 1–2 kali sehari pada permukaan kulit yang luka.',
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
