import 'package:flutter/material.dart';
import 'package:pkl_satunadi/riwayat.dart';
// import 'package:pkl_satunadi/screens/qr_page.dart';
// import 'package:pkl_satunadi/screens/resume_rsvp.dart';

class CopyResep extends StatelessWidget {
  const CopyResep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resep Obat Digital',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RiwayatPage()),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Color(0xFF3B636E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDFA),
              borderRadius: BorderRadius.circular(30),
            ),
            constraints: const BoxConstraints(
              maxHeight: 330.0,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.content_paste,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Detail Kunjungan',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Text(
                  //       "Lokasi",
                  //       style: TextStyle(
                  //         fontFamily: 'Nunito-Regular',
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     Text(
                  //       "RS SatuNadi",
                  //       style: TextStyle(
                  //         fontFamily: 'Nunito-Regular',
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Poliklinik",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Umum",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tanggal\n& Waktu",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "07/05/2024,\n10:00 WIB",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Dokter",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Mia Goth",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Informasi Pasien',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "No Rekam Medis",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "PB001",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Nama",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Aldi Barbara",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "12/05/1992",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDFA),
              borderRadius: BorderRadius.circular(30),
            ),
            constraints: const BoxConstraints(
              maxHeight: 225.0,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.content_paste,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Obat',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Text(
                  //       "Lokasi",
                  //       style: TextStyle(
                  //         fontFamily: 'Nunito-Regular',
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     Text(
                  //       "RS SatuNadi",
                  //       style: TextStyle(
                  //         fontFamily: 'Nunito-Regular',
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "R/  Kalxetin 10mg 10 Tablet",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "      1 X 1.0 Tablet daily",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "R/  Neurobion 10 Tablet",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "      1 X 1.0 Tablet daily",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "R/  Valdres 25mg 10 Tablet",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "      1 X 1.0 Tablet daily",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
