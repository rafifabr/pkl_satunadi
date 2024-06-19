import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/diagnosis/infeksi_lambung.dart';
import 'package:pkl_satunadi/pages/diagnosis/radang_tenggorokan.dart';
import 'package:pkl_satunadi/pages/diagnosis/vertigo.dart';
import 'package:pkl_satunadi/pages/home_page.dart';

class RekamMedisPage extends StatelessWidget {
  const RekamMedisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: Text(
          'Rekam Medis',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF61B297),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
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
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Alamat',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Text(
                        ': Jl. Letjen Suprapto XVIII no. 32',
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
                        'Pekerjaan',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Text(
                        ': Karyawan swasta',
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
            SizedBox(height: 16.0),
            Text(
              'Riwayat Kunjungan',
              style: 
                TextStyle(
                  fontFamily: 'Nunito-Reguler',
                  fontSize: 18.0, 
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildVisitCard(context, '13 April 2020', 'Infeksi Lambung'),
            SizedBox(height: 8.0),
            _buildVisitCard(context, '26 Agustus 2020', 'Vertigo'),
            SizedBox(height: 8.0),
            _buildVisitCard(context, '02 Februari 2021', 'Radang Tenggorokan'),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitCard(BuildContext context, String date, String diagnosis) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.calendar_today),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$date',
              style: TextStyle(
                fontFamily: 'Nunito-Bold',
              ),
            ),
          InkWell(
            onTap: () {
              // Navigasi ke halaman berikutnya berdasarkan diagnosis
              switch (diagnosis.toLowerCase()) {
                case 'infeksi lambung':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfeksiLambungPage()),
                  );
                  break;
                case 'vertigo':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VertigoPage()),
                  );
                  break;
                case 'radang tenggorokan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RadangTenggorokanPage()),
                  );
                  break;
              }
            },
            child: Text(
              'Lihat Detail',
              style: TextStyle(
                fontFamily: 'Nunito-Bold',
                fontSize: 12.0,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
        subtitle: Text(
          'Diagnosis: $diagnosis',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
          ),
        ),
      ),
    );
  }
}

class KunjunganPasienPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rekam Medis',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF61B297),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
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
                        ': SITI MUTMAINAH',
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
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Alamat',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Text(
                        ': Jl. Letjen Suprapto XVIII no. 32',
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
                        'Pekerjaan',
                        style: TextStyle(
                          fontFamily: 'Nunito-Reguler',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Text(
                        ': Karyawan swasta',
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
            SizedBox(height: 16.0),
          ]
        ),
      ),
    );
  }
}