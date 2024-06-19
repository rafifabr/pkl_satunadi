import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF3B636E),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF3B636E),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aldi Barbara',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'No Rekam Medis : PB001',
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ProfileDetailColumn(title: 'NIK', value: '3174055010020009'),
            ProfileDetailColumn(title: 'Tanggal Lahir', value: '12/05/1992'),
            ProfileDetailColumn(title: 'Jenis Kelamin', value: 'Laki-laki'),
            ProfileDetailColumn(title: 'Email', value: 'aldiBarbara@gmail.com'),
            ProfileDetailColumn(title: 'No HP', value: '085211522562'),
            Icon(Icons.edit),
            const SizedBox(height: 10), // Added space before the button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the edit profile page
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => EditProfileScreen(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3E69FE), // Set the background color of the button
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(
                    fontFamily: 'Nunito-Bold',
                    fontSize: 15,
                    color: Colors.white, // Set the text color of the button
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

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Nunito-Bold',
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Nunito-Regular',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}