import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pkl_satunadi/colors.dart';
import 'package:pkl_satunadi/screens/jenis_pembayaran.dart';
import 'package:pkl_satunadi/services/firestore_reservasi_service.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final FirestoreReservasiService _firestoreService =
      FirestoreReservasiService();

  List<String> catNames = [
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

  DateTime? selectedDate;
  TextEditingController searchController = TextEditingController();
  List<String> filteredCatNames = [];

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
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 70),
                            const Text(
                              "Silahkan pilih poliklinik",
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 20),
                              width: MediaQuery.of(context).size.width,
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: wColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: sdColor,
                                    blurRadius: 6,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: searchController,
                                onChanged: (value) {
                                  filteredCatNames = catNames
                                      .where((name) => name
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                      .toList();
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Cari Poli...",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 55),
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: searchController.text.isEmpty
                              ? catNames.length
                              : filteredCatNames.length,
                          itemBuilder: (context, index) {
                            String name = searchController.text.isEmpty
                                ? catNames[index]
                                : filteredCatNames[index];
                            return GestureDetector(
                              onTap: () async {
                                final selectedPoliklinik = name;
                                selectedDate = DateTime.now();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JenisPembayaran(
                                      poliklinik: selectedPoliklinik,
                                      selectedDate: selectedDate!,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 15,
                                      ),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2F8FF),
                                        shape: BoxShape.rectangle,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: sdColor,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: catIcons[catNames.indexOf(name)],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      name,
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
                      const SizedBox(height: 16),
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
