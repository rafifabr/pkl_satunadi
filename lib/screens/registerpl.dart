import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/home_rsvp.dart';
import 'package:pkl_satunadi/services/firestore_reservasi_service.dart';

class RegisterPl extends StatefulWidget {
  @override
  _RegisterPlState createState() => _RegisterPlState();
}

class _RegisterPlState extends State<RegisterPl> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _jenisKelaminController = TextEditingController();
  final TextEditingController _noTeleponController = TextEditingController();
  final FirestoreReservasiService _firestoreService =
      FirestoreReservasiService();

  Future<void> _checkAndFetchPatient() async {
    if (_nikController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap masukkan NIK')),
      );
      return;
    }

    bool pasienExist =
        await _firestoreService.cekPasienExist(_nikController.text);

    if (pasienExist) {
      var pasienData =
          await _firestoreService.getPasienData(_nikController.text);
      _namaController.text = pasienData['namaPasien'];
      _tanggalLahirController.text = pasienData['tanggalLahir'];
      _jenisKelaminController.text = pasienData['jenisKelamin'];
      _noTeleponController.text = pasienData['noTelepon'];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pasien tidak ditemukan')),
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String pasienId = _firestoreService.generateUniqueId();
      await _firestoreService
          .tambahPasienLama(
        pasienId: pasienId,
        nik: _nikController.text,
        namaPasien: _namaController.text,
      )
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }).catchError((error) {
        print("Error: $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pasien Lama',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF3B636E),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Masukkan NIK Anda',
                style: TextStyle(
                  fontFamily: 'Nunito-Bold',
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _nikController,
                decoration: const InputDecoration(
                  labelText: 'NIK',
                  filled: false,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan NIK';
                  }
                  if (value.length != 16 || int.tryParse(value) == null) {
                    return 'NIK harus terdiri dari 16 digit angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _checkAndFetchPatient,
                child: const Text(
                  "Check NIK",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito-Bold',
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 20,
                  shadowColor: Colors.black,
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor: const Color(0xFF61B296),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pasien',
                  filled: false,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _tanggalLahirController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir',
                  filled: false,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _jenisKelaminController,
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                  filled: false,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _noTeleponController,
                decoration: const InputDecoration(
                  labelText: 'No Telepon',
                  filled: false,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 20,
                  shadowColor: Colors.black,
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor: Color.fromARGB(255, 32, 47, 210),
                ),
                child: const Text(
                  "Submit",
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
      ),
      backgroundColor: Colors.white,
    );
  }
}
