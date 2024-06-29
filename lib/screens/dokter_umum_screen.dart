import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/detail_dokter.dart';

class DoctorsUmumScreen extends StatelessWidget {
  final String poliklinik;
  final String metodePembayaran;

  DoctorsUmumScreen({
    required this.poliklinik,
    required this.metodePembayaran,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dokter Umum',
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
        backgroundColor: Colors.white,
      ),
      body: DoctorsSection(
        poliklinik: poliklinik,
        metodePembayaran: metodePembayaran,
      ),
    );
  }
}

class DoctorsSection extends StatefulWidget {
  final String poliklinik;
  final String metodePembayaran;

  DoctorsSection({
    required this.poliklinik,
    required this.metodePembayaran,
  });

  @override
  State<DoctorsSection> createState() => _DoctorsSectionState();
}

class _DoctorsSectionState extends State<DoctorsSection> {
  // List nama dokter dan data dokter
  List<Map<String, dynamic>> doctorsData = [
    {
      'name': 'dr. John Doe',
      'image': 'assets/images/doctor4.jpg',
      'Dokter': 'Umum',
    },
    {
      'name': 'dr. Jane Smith',
      'image': 'assets/images/doctor2.jpg',
      'Dokter': 'Umum',
    },
    {
      'name': 'dr. Michael',
      'image': 'assets/images/doctor3.jpg',
      'Dokter': 'Umum',
    },
    {
      'name': 'dr. Emily White',
      'image': 'assets/images/doctor1.jpg',
      'Dokter': 'Umum',
    },
  ];

  void _handleDoctorSelection(String name, String image, String dokter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetailPage1(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xFF3B636E), // Warna latar belakang
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: doctorsData.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDetailPage1(),
                            ),
                          );
                        },
                        child: Image.asset(
                          '${doctorsData[index]['image']}',
                          height: double.infinity,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorsData[index]['name']!,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Dokter: ${doctorsData[index]['Dokter']}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton(
                    onPressed: () {
                      _handleDoctorSelection(
                        doctorsData[index]['name'],
                        doctorsData[index]['image'],
                        doctorsData[index]['Dokter'],
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'SELENGKAPNYA',
                      style: TextStyle(
                        fontSize:
                            10, // Atur ukuran teks disini sesuai keinginan
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
