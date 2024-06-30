import 'package:flutter/material.dart';

class InfeksiLambungPage extends StatelessWidget {
  const InfeksiLambungPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kunjungan Pasien',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF61B297),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Nama',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 60.0),
                      Text(
                        ': ALDI BARBARA',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 7.0),
                      Text(
                        ': 19 - 02 - 1990',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Usia',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 70.0),
                      Text(
                        ': 31 tahun 2 bulan',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Pemeriksaan Pasien',
              style: TextStyle(
                fontFamily: 'Nunito-Reguler',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF61B297),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Tanggal Kunjungan',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 28.0),
                      Text(
                        ': 13 April 2020',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Diagnosa',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 100.0),
                      Text(
                        ': Infeksi lambung',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Anamnesa',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 90.0),
                      Text(
                        ': Perut perih, susah makan',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 140,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 182,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Golongan \nDarah',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'B',
                              style: TextStyle(
                                fontFamily: 'Nunito-Reguler',
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Tinggi \nBadan',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '190',
                              style: TextStyle(
                                fontFamily: 'Nunito-Reguler',
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 140,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 182,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Indeks Massa \nTubuh',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '18.5',
                              style: TextStyle(
                                fontFamily: 'Nunito-Reguler',
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Berat \nBadan',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '90',
                              style: TextStyle(
                                fontFamily: 'Nunito-Reguler',
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 140,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 182,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Tekanan \nDarah',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '90/60',
                              style: TextStyle(
                                fontFamily: 'Nunito-Reguler',
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Detak \nJantung',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '100 bpm',
                              style: TextStyle(
                                fontFamily: 'Nunito-Reguler',
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
