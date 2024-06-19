import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:pkl_satunadi/screens/registerpb.dart';
import 'package:pkl_satunadi/screens/registerpl.dart';

class DetailPasienPage extends StatelessWidget {
  const DetailPasienPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pasien',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigasi kembali ke halaman Home
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(50.0),
            child: Text(
              "Pilih Jenis Pasien",
              style: TextStyle(
                fontFamily: 'Nunito-Bold',
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPb(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/pasien_baru.png',
                            width: 100,
                            height: 100,
                            // fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Pasien Baru",
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPl(), 
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/pasien_lama.png',
                            width: 100,
                            height: 100,
                            // fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Pasien Lama",
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF3B636E),
    );
  }
}
