import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/qr_page.dart';
import 'package:pkl_satunadi/screens/resume_rsvp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DetailRsvpPage(),
    );
  }
}

class DetailRsvpPage extends StatelessWidget {
  const DetailRsvpPage({super.key});

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResumeRsvpPage()),
            );
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
            child: const Center(
              child: Text(
                'Rincian Reservasi Anda',
                style: TextStyle(
                  fontFamily: 'Nunito-Bold',
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Color(0xFFFFFDFA),
              borderRadius: BorderRadius.circular(30),
            ),
            constraints: const BoxConstraints(
              maxHeight: 120.0,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Nomor\nAntrian',
                          style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            color: Colors.black,
                            fontSize: 20,
                            // letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 25),
                        Text(
                          '110',
                          style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            color: Colors.black,
                            fontSize: 45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  'Jangan lupa datang 15 menit sebelum jadwal',
                  style: TextStyle(
                    fontFamily: 'Nunito-Bold',
                    color: Colors.black,
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDFA),
              borderRadius: BorderRadius.circular(30),
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
                      MaterialPageRoute(builder: (context) => const QRPage()),
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
                    "Tampilkan Barcode",
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
                    _showCancelConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 20,
                    shadowColor: Colors.black,
                    minimumSize: const Size(350, 45),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    "Batalkan Janji Temu",
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
  // void _showCancelDialog(BuildContext context) {
  //   // Logika untuk menampilkan pop-up barcode (jika diperlukan)
  //   print('Tampilkan Barcode');
  // }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFE1F0EA),
          title: const 
          Text(
            "Konfirmasi Pembatalan",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Nunito-Regular',
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          content: const 
          Text(
            "Apakah Anda yakin akan membatalkan janji temu?",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Nunito-Bold',
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const 
              Text(
                "Tidak", 
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito-Bold',
                  color: Colors.red,
                ),  
              ),
            ),
            TextButton(
              onPressed: () {
                // Logika pembatalan janji temu di sini
                Navigator.pop(context);
              },
              child: const 
              Text(
                "Ya",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito-Regular',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}