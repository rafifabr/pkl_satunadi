import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pkl_satunadi/screens/home_rsvp.dart';

class RegisterPb extends StatelessWidget {
  const RegisterPb({super.key});

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
              decoration: const InputDecoration(
                labelText: 'NIK',
                filled: false,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nama Pasien',
                filled: false,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
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
                  // Handle selected date
                }
              },
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
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
                // Handle selected gender
              },
            ),
            SizedBox(height: 20.0),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                // Handle input changes
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
              initialValue: PhoneNumber(isoCode: 'ID'),
              textFieldController: TextEditingController(),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
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
      backgroundColor: Colors.white,
    );
  }
}