import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pkl_satunadi/screens/dokter_umum_screen.dart';
import 'package:flutter/material.dart';
import 'package:pkl_satunadi/colors.dart';
import 'package:pkl_satunadi/screens/jenis_pembayaran.dart';

class Dashboard extends StatelessWidget {
  List catNames = [
    "Umum",
    "Mata",
    "THT",
    "Gigi",
    "Paru-Paru",
    "Kardiologi",
    "Neurologi",
    "Urologi",
    "Fisioterapi",
    "Penyakit Dalam",
    "Bedah",
    "Orthopedi",
    "Kulit & Kelamin",
    "Obgyn",
    "Jiwa",
  ];

  List<Icon> catIcons = [
    Icon(MdiIcons.medicalBag, color: tColor, size: 30),
    Icon(MdiIcons.eye, color: tColor, size: 30),
    Icon(MdiIcons.earHearing, color: tColor, size: 30),
    Icon(MdiIcons.toothOutline, color: tColor, size: 30),
    Icon(MdiIcons.lungs, color: tColor, size: 30),
    Icon(MdiIcons.heart, color: tColor, size: 30),
    Icon(MdiIcons.brain, color: tColor, size: 30),
    Icon(MdiIcons.stomach, color: tColor, size: 30),
    Icon(MdiIcons.footPrint, color: tColor, size: 30),
    Icon(MdiIcons.medication, color: tColor, size: 30),
    Icon(MdiIcons.scissorsCutting, color: tColor, size: 30),
    Icon(MdiIcons.bone, color: tColor, size: 30),
    Icon(MdiIcons.human, color: tColor, size: 30),
    Icon(MdiIcons.medicationOutline, color: tColor, size: 30),
    Icon(MdiIcons.medication, color: tColor, size: 30),
  ];

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Material(
            color: const Color(0xFFFFFFFF),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF3B636E),
                        pColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 70),
                            const Text(
                              "Mari Temukan Dokter Untuk Anda",
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 20),
                              width: MediaQuery.of(context).size.width,
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: wColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: sdColor,
                                    blurRadius: 6,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Cari Dokter...",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 55),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Poliklinik",
                          style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: catNames.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                switch (catNames[index]) {
                                  case "Umum":
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JenisPembayaran(),
                                      ),
                                    );
                                    break;
                                }
                              },
                              child: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 15,
                                      ),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F8FF),
                                        shape: BoxShape.rectangle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: sdColor,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: catIcons[index],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      catNames[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: bColor.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),  // Added SizedBox to provide space between GridView and the next content
                      // Additional content below GridView goes here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
