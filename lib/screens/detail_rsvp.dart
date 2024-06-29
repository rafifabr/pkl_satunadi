import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pkl_satunadi/screens/qr_page.dart';
import 'package:pkl_satunadi/services/firestore_reservasi_service.dart';

class DetailRsvpPage extends StatefulWidget {
  final String reservasiId;
  final String poliklinik;
  final String metodePembayaran;

  const DetailRsvpPage({
    required this.reservasiId,
    required this.poliklinik,
    required this.metodePembayaran,
    Key? key,
  }) : super(key: key);

  @override
  _DetailRsvpPageState createState() => _DetailRsvpPageState();
}

class _DetailRsvpPageState extends State<DetailRsvpPage> {
  late Future<DocumentSnapshot> reservasiFuture;

  @override
  void initState() {
    super.initState();
    reservasiFuture = FirebaseFirestore.instance
        .collection('reservasi')
        .doc(widget.reservasiId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rincian Reservasi',
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
      body: FutureBuilder<DocumentSnapshot>(
        future: reservasiFuture,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text("Reservasi tidak ditemukan"));
          }

          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
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
                      buildDetailRow('Poliklinik', data['poliklinik']),
                      buildDetailRow('Tanggal & Waktu',
                          "${data['tanggal']}, ${data['waktu']}"),
                      buildDetailRow('Dokter', data['namaDokter']),
                      buildDetailRow(
                          'Metode Pembayaran', widget.metodePembayaran),
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
                      buildDetailRow('NIK', data['nik']),
                      buildDetailRow('Nama', data['namaPasien']),
                      buildDetailRow('Tanggal Lahir', data['tanggalLahir']),
                      buildDetailRow('Jenis Kelamin', data['jenisKelamin']),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          FirestoreReservasiService service =
                              FirestoreReservasiService();
                          String reservasiId = await service.createReservasi(
                            'RS SatuNadi',
                            widget.poliklinik,
                            data['tanggal'],
                            data['waktu'],
                            data['namaDokter'],
                            widget.metodePembayaran,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QRPage(
                                reservasiId: reservasiId,
                                poliklinik: widget.poliklinik,
                                metodePembayaran: widget.metodePembayaran,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 20,
                          shadowColor: Colors.black,
                          minimumSize: const Size(350, 45),
                          backgroundColor: const Color(0xFF3E69FE),
                        ),
                        child: const Text(
                          "Konfirmasi",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Nunito-Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showCancelConfirmationDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 20,
                          shadowColor: Colors.black,
                          minimumSize: const Size(350, 45),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "Batal",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Nunito-Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Nunito-Regular',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Nunito-Regular',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Pembatalan"),
          content:
              const Text("Apakah Anda yakin ingin membatalkan janji temu ini?"),
          actions: [
            TextButton(
              child: const Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Ya"),
              onPressed: () {
                _cancelReservasi(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _cancelReservasi(BuildContext context) async {
    // Implement your cancel reservation logic here
    // For example, update the reservation status in Firestore
    Navigator.of(context).pop(); // Close the dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Janji temu telah dibatalkan'),
      ),
    );
  }
}
