import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DokterUmumPage(),
    );
  }
}

class DokterUmumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokter Umum'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Fungsi untuk kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 194, 80, 80), // Warna latar belakang container
          borderRadius: BorderRadius.circular(12.0), // Sudut bulat container
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Perpindahan bayangan dari container
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Container untuk profile image
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/profile_image.jpg'), // Gantilah dengan path gambar sesuai kebutuhan
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                // Nama dokter dan keterangan dokter umum
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Dokter',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dokter Umum',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Keterangan dokter umum
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            // Tombol Selengkapnya
            ElevatedButton(
              onPressed: () {
                // Fungsi yang akan dijalankan ketika tombol "Selengkapnya" ditekan
                // Misalnya, untuk membuka halaman detail dokter
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailDokterPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Sudut bulat tombol
                ),
              ),
              child: Text('Selengkapnya'),
            ),
          ],
        ),
      ),
    );
  }
}
