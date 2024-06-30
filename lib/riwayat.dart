import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:pkl_satunadi/screens/resume_rsvp.dart';
import 'package:pkl_satunadi/services/firestore_reservasi_service.dart';
import 'package:pkl_satunadi/copy_resep.dart'; // Import the CopyResep page

class RiwayatPage extends StatefulWidget {
  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FirestoreReservasiService _reservasiService =
      FirestoreReservasiService();
  late Future<List<Map<String, dynamic>>> _reservasiMendatang;
  late Future<List<Map<String, dynamic>>> _reservasiSelesai;
  late Future<List<Map<String, dynamic>>> _reservasiBatal;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadReservasi();
  }

  void _loadReservasi() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _reservasiMendatang =
          _reservasiService.getReservasiByUser(user.uid, status: 'mendatang');
      _reservasiSelesai = _getDummyData('selesai'); // Dummy data for 'Selesai'
      _reservasiBatal = _getDummyData('batal'); // Dummy data for 'Batal'
    } else {
      _reservasiMendatang = Future.value([]);
      _reservasiSelesai = Future.value([]);
      _reservasiBatal = Future.value([]);
    }
  }

  Future<List<Map<String, dynamic>>> _getDummyData(String status) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    if (status == 'selesai') {
      return [
        {
          'reservasiId': '1',
          'namaDokter': 'Dr. John Doe',
          'tanggal': '2023-06-01',
          'waktu': '10:00 AM',
          'poliklinik': 'Umum',
          'metodePembayaran': 'Cash',
        },
      ];
    } else if (status == 'batal') {
      return [
        {
          'reservasiId': '3',
          'namaDokter': 'Dr. Alice Brown',
          'tanggal': '2023-06-03',
          'waktu': '09:00 AM',
          'poliklinik': 'Mata',
          'metodePembayaran': 'Cash',
        },
        {
          'reservasiId': '4',
          'namaDokter': 'Dr. Bob White',
          'tanggal': '2023-06-04',
          'waktu': '01:00 PM',
          'poliklinik': 'Kulit',
          'metodePembayaran': 'Insurance',
        },
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B636E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text(
          'Riwayat Reservasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF3B636E),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Mendatang'),
                Tab(text: 'Selesai'),
                Tab(text: 'Batal'),
              ],
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildReservasiList(_reservasiMendatang),
                _buildReservasiList(_reservasiSelesai),
                _buildReservasiList(_reservasiBatal),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReservasiList(
      Future<List<Map<String, dynamic>>> reservasiFuture) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: reservasiFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          final reservasiList = snapshot.data!;
          return ListView.builder(
            itemCount: reservasiList.length,
            itemBuilder: (context, index) {
              final reservasi = reservasiList[index];
              return Card(
                child: ListTile(
                  title: Text(reservasi['namaDokter']),
                  subtitle:
                      Text('${reservasi['tanggal']} - ${reservasi['waktu']}'),
                  trailing: _buildTrailingButton(reservasi),
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildTrailingButton(Map<String, dynamic> reservasi) {
    if (_tabController.index == 2) {
      // Check if the current tab is 'Batal'
      return ElevatedButton(
        onPressed: null, // Disabled button
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
        ),
        child: const Text('Janji Temu Dibatalkan'),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          if (_tabController.index == 1) {
            // Check if the current tab is 'Selesai'
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CopyResep(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResumeRsvpPage(
                  reservasiId: reservasi['reservasiId'],
                  poliklinik: reservasi['poliklinik'],
                  metodePembayaran: reservasi['metodePembayaran'],
                  reservasi: reservasi,
                ),
              ),
            );
          }
        },
        child: const Text('Detail Reservasi'),
      );
    }
  }
}
