// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:pkl_satunadi/riwayat.dart';
import 'package:pkl_satunadi/settings_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _currentIndex = 3; // Indeks halaman saat aplikasi dibuka

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Gunakan WillPopScope untuk menangani ketika tombol back ditekan
      onWillPop: () async {
        // Beralih ke halaman dashboard (HomePage) saat tombol back ditekan
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        // Return false agar tidak tampil prompt konfirmasi keluar
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notifikasi",
            style: TextStyle(
              fontFamily: 'Nunito-Bold',
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
            ),
          ),
          backgroundColor: Color(0xFF3B636E),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              // Beralih ke halaman dashboard (HomePage) saat tombol back ditekan
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container untuk menampilkan nomor antrian
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.queue),
                    Text(
                      'Nomor Antrian Saat Ini: 5',
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // Handle navigasi berdasarkan index yang dipilih
              switch (index) {
                case 0:
                  // Beranda
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 1:
                  // Riwayat
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => RiwayatPage()));
                  break;
                case 2:
                  // Kartu
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => KartuPage()));
                  break;
                case 3:
                  // Pengaturan
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                  break;
              }
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Kartu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
          ],
          selectedItemColor: Color(0xff006B54),
          unselectedItemColor: Colors.black,
          backgroundColor: Color(0xffFFFDFA),
        ),
      ),
    );
  }
}
