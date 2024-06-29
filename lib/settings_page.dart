import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkl_satunadi/card.dart';
import 'package:pkl_satunadi/notification.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:pkl_satunadi/profile.dart';
// import 'package:pkl_satunadi/riwayat.dart';
import 'package:pkl_satunadi/welcome_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pengaturan",
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9E0E2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.person, color: Colors.black),
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Profil",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Nunito-Regular',
                        ),
                      ),
                      SizedBox(height: 3),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.chevron_forward,
                        color: Colors.grey.shade600,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyProfileScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Keluar",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              switch (index) {
                case 0:
                  // Beranda
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 1:
                // // Riwayat
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => RiwayatPage()));
                // break;
                case 2:
                  // Kartu
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => KartuPage()));
                  break;
                case 3:
                  // Pengaturan
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()));
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
