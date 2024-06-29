import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/qr_page.dart';

class ResumeRsvpPage extends StatefulWidget {
  final String reservasiId;
  final String poliklinik;
  final String metodePembayaran;
  final Map<String, dynamic> reservasi;

  const ResumeRsvpPage({
    required this.reservasiId,
    required this.poliklinik,
    required this.metodePembayaran,
    required this.reservasi,
  });

  @override
  _ResumeRsvpPageState createState() => _ResumeRsvpPageState();
}

class _ResumeRsvpPageState extends State<ResumeRsvpPage> {
  late Future<DocumentSnapshot> reservasiFuture;
  Future<Map<String, dynamic>?>? pasienFuture;
  String? userId;

  @override
  void initState() {
    super.initState();
    fetchUserId();
  }

  void fetchUserId() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid;
        reservasiFuture = fetchReservasi();
      });
    } else {
      throw Exception("User not logged in");
    }
  }

  Future<DocumentSnapshot> fetchReservasi() async {
    try {
      DocumentSnapshot reservasi = await FirebaseFirestore.instance
          .collection('reservasi')
          .doc(widget.reservasiId)
          .get();

      if (reservasi.exists) {
        Map<String, dynamic> data = reservasi.data() as Map<String, dynamic>;
        if (data.containsKey('userId')) {
          pasienFuture = fetchPasien(data['userId']);
        } else {
          pasienFuture = Future.value(null);
        }
      } else {
        pasienFuture = Future.value(null);
      }
      return reservasi;
    } catch (error) {
      throw Exception("Error fetching reservasi: $error");
    }
  }

  Future<Map<String, dynamic>?> fetchPasien(String userId) async {
    try {
      DocumentSnapshot? pasienSnapshot;
      Map<String, dynamic>? pasienData;

      // Fetch from pasienLama first
      QuerySnapshot querySnapshotLama = await FirebaseFirestore.instance
          .collection('pasienLama')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();

      if (querySnapshotLama.docs.isNotEmpty) {
        pasienSnapshot = querySnapshotLama.docs.first;
        pasienData = pasienSnapshot.data() as Map<String, dynamic>;
      } else {
        // If not found in pasienLama, fetch from pasienBaru
        QuerySnapshot querySnapshotBaru = await FirebaseFirestore.instance
            .collection('pasienBaru')
            .where('userId', isEqualTo: userId)
            .limit(1)
            .get();

        if (querySnapshotBaru.docs.isNotEmpty) {
          pasienSnapshot = querySnapshotBaru.docs.first;
          pasienData = pasienSnapshot.data() as Map<String, dynamic>;
        }
      }

      if (pasienSnapshot == null) {
        print(
            "Logging information: Pasien with userId $userId does not exist.");
        return null;
      }

      // Always fetch tanggalLahir and jenisKelamin from pasienBaru
      DocumentSnapshot pasienBaruSnapshot = await FirebaseFirestore.instance
          .collection('pasienBaru')
          .doc(userId)
          .get();

      if (pasienBaruSnapshot.exists) {
        Map<String, dynamic> pasienBaruData =
            pasienBaruSnapshot.data() as Map<String, dynamic>;
        pasienData?['tanggalLahir'] = pasienBaruData['tanggalLahir'];
        pasienData?['jenisKelamin'] = pasienBaruData['jenisKelamin'];
      }

      return pasienData;
    } catch (error) {
      if (error is FirebaseException && error.code == 'permission-denied') {
        print(
            "Logging information: Permission denied when accessing pasien data.");
      } else {
        print("Logging information: Error fetching pasien: $error");
      }
      throw Exception("Error fetching pasien: $error");
    }
  }

  void _batalkanReservasi() async {
    try {
      await FirebaseFirestore.instance
          .collection('reservasi')
          .doc(widget.reservasiId)
          .delete();

      // Redirect to previous screen after successful deletion
      Navigator.pop(context, true);
    } catch (e) {
      print("Error deleting reservasi: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal membatalkan reservasi: $e"),
        ),
      );
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Batalkan Reservasi'),
          content: Text('Apakah yakin untuk membatalkan reservasi ini?'),
          actions: <Widget>[
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
                _batalkanReservasi();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resume Reservasi',
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
      backgroundColor: const Color(0xFF3B636E),
      body: userId == null
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<DocumentSnapshot>(
              future: reservasiFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(child: Text("Reservasi tidak ditemukan"));
                }

                Map<String, dynamic> reservasiData =
                    snapshot.data!.data() as Map<String, dynamic>;

                return FutureBuilder<Map<String, dynamic>?>(
                  future: pasienFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Center(child: Text("Pasien tidak ditemukan"));
                    }

                    Map<String, dynamic>? pasienData = snapshot.data;

                    return buildContent(reservasiData, pasienData);
                  },
                );
              },
            ),
    );
  }

  Widget buildContent(
      Map<String, dynamic> reservasiData, Map<String, dynamic>? pasienData) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 150),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8.0,
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail Reservasi',
                  style: TextStyle(
                    fontFamily: 'Nunito-Bold',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                buildDetailRow('Lokasi', 'RS SatuNadi'),
                buildDetailRow(
                    'Poliklinik', reservasiData['poliklinik'] ?? 'N/A'),
                buildDetailRow('Tanggal', reservasiData['tanggal'] ?? 'N/A'),
                buildDetailRow('Waktu', reservasiData['waktu'] ?? 'N/A'),
                buildDetailRow('Dokter', reservasiData['namaDokter'] ?? 'N/A'),
                const Divider(color: Colors.black),
                const Text(
                  'Informasi Pribadi',
                  style: TextStyle(
                    fontFamily: 'Nunito-Bold',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                buildDetailRow('Pasien ID', pasienData?['pasienId'] ?? 'N/A'),
                buildDetailRow('Nama', pasienData?['namaPasien'] ?? 'N/A'),
                // buildDetailRow(
                //     'Tanggal Lahir', pasienData?['tanggalLahir'] ?? 'N/A'),
                // buildDetailRow(
                //     'Jenis Kelamin', pasienData?['jenisKelamin'] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildButton(
            text: "Konfirmasi",
            color: const Color(0xFF3E69FE),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRPage(
                    reservasiId: widget.reservasiId,
                    poliklinik: widget.poliklinik,
                    metodePembayaran: widget.metodePembayaran,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          buildButton(
            text: "Batalkan Reservasi",
            color: Colors.red,
            onPressed: _showConfirmationDialog,
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Nunito-Regular',
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Nunito-Regular',
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget buildButton(
      {required String text,
      required Color color,
      required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
