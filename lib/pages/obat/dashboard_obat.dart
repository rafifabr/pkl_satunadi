import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:pkl_satunadi/pages/obat/acarbose.dart';
// import 'package:mojadiapp/alpes.dart';

class ObatScreen extends StatefulWidget {
  const ObatScreen({Key? key}) : super(key: key);

  @override
  State<ObatScreen> createState() => _ObatScreenState();
}

class _ObatScreenState extends State<ObatScreen> {
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
              MaterialPageRoute(builder: (context) => const HomePage()),
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
    );
  }

  Widget _buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: -2, 
          left: 28,
          child: Container(
            margin: EdgeInsets.only(top: 15, bottom: 20),
            width: size.width * 0.86,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFF3F8FE), 
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Silahkan cari obat yang diinginkan",
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 73,
          left: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Pilihan Obat",
                textAlign: TextAlign.start,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                  ),
              ),
            ],
          ),
        ),
        
        Positioned(
          top: 105,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Acarbose",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AcarboseScreen()),
                );
              },
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),

        Positioned(
          top: 155,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Betadine",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 205,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Cataflam",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 255,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Dulcolax",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 305,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Entrostop",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 355,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Furosemide",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 405,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Glimepiride",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 455,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Hufagripp",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 505,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Ibuprofen",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 555,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Januvia",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 605,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Konidin",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 655,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Lameson",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
        Positioned(
          top: 705,
          left: 28,
          right: 28,
          child: Container(
            height: 30, 
            padding: EdgeInsets.only(left: 20, top: 5),
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
                "Metformin",
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              ),
          ),
        ),
      ],
    );
  }
}