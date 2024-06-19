import 'package:flutter/material.dart';
import 'package:pkl_satunadi/screens/home_rsvp.dart';

class RegisterPl extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Masukkan Nomor RM (Rekam Medis) Anda',
              style: TextStyle(
                fontFamily: 'Nunito-Bold',
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nomor RM',
                // border: OutlineInputBorder(),
                filled: false,  
                fillColor: Colors.white,  
              ),
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
