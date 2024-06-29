import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreReservasiService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference _reservasiCollection =
      FirebaseFirestore.instance.collection('reservasi');

  // Function to generate a unique ID
  String generateUniqueId() {
    return _db.collection('pasienBaru').doc().id;
  }

  // Function to check if a patient exists based on NIK
  Future<bool> cekPasienExist(String nik) async {
    final QuerySnapshot result =
        await _db.collection('pasienBaru').where('nik', isEqualTo: nik).get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  // Function to fetch patient data based on NIK
  Future<Map<String, dynamic>> getPasienData(String nik) async {
    final QuerySnapshot result =
        await _db.collection('pasienBaru').where('nik', isEqualTo: nik).get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.isNotEmpty) {
      return documents.first.data() as Map<String, dynamic>;
    } else {
      throw Exception("Pasien not found");
    }
  }

  // Function to add a new patient
  Future<void> tambahPasienBaru({
    required String pasienId,
    required String nik,
    required String namaPasien,
    required String tanggalLahir,
    required String jenisKelamin,
    required String noTelepon,
  }) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    Map<String, dynamic> data = {
      'pasienId': pasienId,
      'nik': nik,
      'namaPasien': namaPasien,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'noTelepon': noTelepon,
      'userId': user.uid, // Ensure userId is included in the data
    };

    try {
      await _db.collection('pasienBaru').doc(pasienId).set(data);
      print("Pasien berhasil ditambahkan dengan ID: $pasienId");
    } catch (error) {
      print("Gagal menambahkan Pasien: $error");
      rethrow; // Re-throw the caught error
    }
  }

  // Function to add an existing patient
  Future<void> tambahPasienLama({
    required String pasienId,
    required String nik,
    required String namaPasien,
  }) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    Map<String, dynamic> data = {
      'pasienId': pasienId,
      'nik': nik,
      'namaPasien': namaPasien,
      'userId': user.uid, // Ensure userId is included in the data
    };

    try {
      await _db.collection('pasienLama').doc(pasienId).set(data);
      print("Pasien lama berhasil ditambahkan dengan ID: $pasienId");
    } catch (error) {
      print("Gagal menambahkan Pasien lama: $error");
      rethrow; // Re-throw the caught error
    }
  }

  // Function to add a reservation
  Future<String> tambahReservasi(
    String poliklinik,
    String metodePembayaran,
    String namaDokter,
    String tanggal,
    String waktu, {
    required String reservasiId,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not authenticated");
      return Future.error("User is not authenticated");
    }

    Map<String, dynamic> data = {
      'poliklinik': poliklinik,
      'metodePembayaran': metodePembayaran,
      'namaDokter': namaDokter,
      'tanggal': tanggal,
      'waktu': waktu,
      'userId': user.uid,
    };

    // Debugging: print data to be added
    print("Data to be added: $data");

    DocumentReference docRef =
        _reservasiCollection.doc(reservasiId); // Use the custom ID
    await docRef.set(data);
    return docRef.id;
  }

  // Function to get the list of clinics
  Future<List<String>> getPoliklinikList() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('poliklinik').get();
      return querySnapshot.docs.map((doc) => doc['nama'] as String).toList();
    } catch (e) {
      print("Error getting poliklinik list: $e");
      return [];
    }
  }

  // Function to get the list of payment methods
  Future<List<String>> getMetodePembayaranList() async {
    try {
      QuerySnapshot querySnapshot =
          await _db.collection('metodePembayaran').get();
      return querySnapshot.docs.map((doc) => doc['nama'] as String).toList();
    } catch (e) {
      print("Error getting metode pembayaran list: $e");
      return [];
    }
  }

  // Function to get reservations by userId from subcollection
  Future<List<Map<String, dynamic>>> getReservasiByUser(String userId,
      {required String status}) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('reservasi')
          .where('userId', isEqualTo: userId)
          .get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['reservasiId'] = doc.id; // Add document ID as reservasiId
        return data;
      }).toList();
    } catch (e) {
      print("Error getting reservasi list: $e");
      return [];
    }
  }

  // Method to create a new reservation
  Future<String> createReservasi(
    String lokasi,
    String poliklinik,
    String tanggal,
    String waktu,
    String namaDokter,
    String metodePembayaran,
  ) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    Map<String, dynamic> data = {
      'userId': user.uid,
      'lokasi': lokasi,
      'poliklinik': poliklinik,
      'tanggal': tanggal,
      'waktu': waktu,
      'namaDokter': namaDokter,
      'metodePembayaran': metodePembayaran,
    };

    DocumentReference docRef = await _db.collection('reservasi').add(data);
    return docRef.id;
  }
}
