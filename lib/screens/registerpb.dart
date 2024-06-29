import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pkl_satunadi/screens/home_rsvp.dart';
import 'package:pkl_satunadi/services/firestore_reservasi_service.dart';

class RegisterPb extends StatefulWidget {
  final String nik;
  final String namaPasien;
  final String tanggalLahir;
  final String jenisKelamin;
  final String nomorTelepon;

  RegisterPb({
    required this.nik,
    required this.namaPasien,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.nomorTelepon,
  });

  @override
  _RegisterPbState createState() => _RegisterPbState();
}

class _RegisterPbState extends State<RegisterPb> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreReservasiService _firestoreService =
      FirestoreReservasiService();

  late TextEditingController _nikController;
  late TextEditingController _namaController;
  late TextEditingController _tanggalLahirController;
  late TextEditingController _nomorTeleponController;
  String _jenisKelamin = 'Laki-laki';
  String initialCountry = 'ID';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');

  @override
  void initState() {
    super.initState();
    _nikController = TextEditingController(text: widget.nik);
    _namaController = TextEditingController(text: widget.namaPasien);
    _tanggalLahirController = TextEditingController(text: widget.tanggalLahir);
    _nomorTeleponController = TextEditingController(text: widget.nomorTelepon);
  }

  String removeCountryCode(String phoneNumber) {
    return phoneNumber.startsWith('+62')
        ? phoneNumber.substring(3)
        : phoneNumber;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String pasienId = _firestoreService.generateUniqueId();

      await _firestoreService
          .tambahPasienBaru(
        pasienId: pasienId,
        nik: _nikController.text,
        namaPasien: _namaController.text,
        tanggalLahir: _tanggalLahirController.text,
        jenisKelamin: _jenisKelamin,
        noTelepon: _nomorTeleponController.text,
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
          'Pasien Baru',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Mohon Lengkapi Data Diri Anda',
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
                    return 'Mohon masukkan NIK';
                  }
                  if (value.length != 16 || int.tryParse(value) == null) {
                    return 'NIK harus terdiri dari 16 digit angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pasien',
                  filled: false,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon masukkan nama pasien';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _tanggalLahirController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir',
                  filled: false,
                  fillColor: Colors.white,
                ),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDate != null) {
                    _tanggalLahirController.text =
                        selectedDate.toLocal().toString().split(' ')[0];
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon masukkan tanggal lahir';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _jenisKelamin,
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                  filled: false,
                  fillColor: Colors.white,
                ),
                items: ['Laki-laki', 'Perempuan']
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  String phoneNumber = removeCountryCode(number.phoneNumber!);
                  _nomorTeleponController.text = phoneNumber;
                },
                onInputValidated: (bool value) {
                  // Handle validation
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: _nomorTeleponController,
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 20,
                  shadowColor: Colors.black,
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor: const Color(0xFF61B296),
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
