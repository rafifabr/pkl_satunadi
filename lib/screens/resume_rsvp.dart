import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/detail_rsvp.dart';
import 'package:pkl_satunadi/screens/dokter_umum_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResumeRsvpPage(),
    );
  }
}

class ResumeRsvpPage extends StatelessWidget {
  const ResumeRsvpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resume Reservasi',
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Color(0xFF3B636E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: null,
            // child: const Center(
            //   child: Text(
            //     'Rincian Reservasi Anda',
            //     style: TextStyle(
            //       fontFamily: 'Nunito-Bold',
            //       color: Colors.white,
            //       fontSize: 25,
            //     ),
            //   ),
            // ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDFA),
              borderRadius: BorderRadius.circular(0),
            ),
            constraints: const BoxConstraints(
              maxHeight: 390.0,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child:  Icon(
                        Icons.content_paste,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Detail Reservasi',
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
                        "Lokasi",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "RS SatuNadi",
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
                      child:  Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Informasi Pribadi',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Jenis Kelamin",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Laki-laki",
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DetailRsvpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 20,
                    shadowColor: Colors.black,
                    minimumSize: const Size(350, 45),
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
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
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
                    minimumSize: const Size(350, 45),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    "Edit Janji Temu",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}