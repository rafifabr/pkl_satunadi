import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/home_page.dart';

class KartuPage extends StatefulWidget {
  @override
  _KartuPageState createState() => _KartuPageState();
}

class _KartuPageState extends State<KartuPage> {
  String? selectedOption;
  final Map<String, String> cardImages = {
    'Asuransi': 'assets/images/asuransi.png',
    'BPJS': 'assets/images/bpjs.png'
  };

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
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Kartu',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Jenis Kartu'),
              value: selectedOption,
              items: cardImages.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedOption != null)
              Container(
                width: double.infinity,
                height: 300,
                child: Card(
                  color: const Color(0xFFD9D9D9),
                  margin: const EdgeInsets.all(32),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      cardImages[selectedOption!]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
