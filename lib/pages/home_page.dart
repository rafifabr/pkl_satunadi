import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkl_satunadi/card.dart';
import 'package:pkl_satunadi/notification.dart';
import 'package:pkl_satunadi/screens/detail_pasien.dart';
import 'package:pkl_satunadi/pages/obat/dashboard_obat.dart';
import 'package:pkl_satunadi/screens/registerpb.dart';
import 'package:pkl_satunadi/riwayat.dart';
import 'package:pkl_satunadi/settings_page.dart';
import 'package:pkl_satunadi/rekam_medis.dart';
import 'package:pkl_satunadi/style/app_style.dart';
import '../data/data.dart';
import '../size_config.dart';
// import 'e_reservasi_page.dart'; 
// import 'informasi_obat_page.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff3B636E),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 7,
          ),
          child: const Column(
            children: [
              SelamatDatang(),
              Services(),
            ],
          ),
        ),
        const Artikel()
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          // Handle navigasi berdasarkan index yang dipilih
          switch (index) {
            case 0:
              // Beranda
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
              break;
            case 1:
              // Riwayat
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RiwayatPage()));
              break;
            case 2:
              // Kartu
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => KartuPage()));
              break;
            case 3:
              // Pengaturan
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const NotificationPage()));
              break;
            case 4:
              // Pengaturan
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const SettingsPage()));
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
    );
  }
}

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.blockSizeVertical! * 2,
            left: SizeConfig.blockSizeHorizontal! * 7,
          ),
        ),
        Text(
          "Silahkan Pilih Jenis Layanan yang Anda Inginkan Hari Ini",
          style: TextStyle(
              fontFamily: 'Nunito-Bold',
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
            ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal! * 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: servicesList.length,
            itemBuilder: (BuildContext context, int index) {
              final e = servicesList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    // Handle ketika layanan dipilih
                    if (e.title == 'E-Reservasi') {
                      // Beralih ke halaman E-Reservasi
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPasienPage()),
                      );
                    } else if (e.title == 'Informasi Obat') {
                      // Beralih ke halaman Informasi Obat
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ObatScreen()),
                      );
                    } else if (e.title == 'Rekam Medis') {
                      // Beralih ke halaman Rekam Medis
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RekamMedisPage()),
                      );
                    }
                    // Tambahkan logika untuk layanan lain jika diperlukan
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 25.5,
                    height: 60,
                    decoration: BoxDecoration(
                      color: e.color,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 0.9,
                          child: Image.asset(e.image),
                        ),
                        SizedBox(height: 12),
                        Text(
                          e.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SelamatDatang extends StatelessWidget {
  const SelamatDatang({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffFFFDFA),
              borderRadius: BorderRadius.all(Radius.circular(28.0)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal! * 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Selamat Datang,\nAldi Barbara",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1),
                        Text(
                          "Selalu jaga kesehatan, ya!",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                fontSize: 13.0,
                                height: 1.5,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 1), // Adjust the top padding here
                    child: Image.asset(AppStyle.image1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Artikel extends StatelessWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical! * 2,
            left: SizeConfig.blockSizeHorizontal! * 7,
          ),
          child: const Text(
            "Artikel Hari Ini",
            style: TextStyle(
              fontFamily: 'Nunito-Bold',
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: upcomingArtikelList.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 40),
              child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: Container(
                  width: SizeConfig.blockSizeHorizontal! * 80,
                  decoration: BoxDecoration(
                    color: e.color,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: 71.46,
                        height: 99.03,
                        decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(26.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset(e.image, fit: BoxFit.contain)],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    height: 1.8,
                                    letterSpacing: 1,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}