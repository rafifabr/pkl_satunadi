import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileScreen extends StatelessWidget {
  final Map<String, dynamic>? userData;

  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();

  EditProfileScreen({Key? key, required this.userData}) : super(key: key) {
    if (userData != null) {
      _nikController.text = userData!['NIK'] ?? '';
      _fullNameController.text = userData!['namaLengkap'] ?? '';
      _emailController.text = userData!['email'] ?? '';
      _genderController.text = userData!['gender'] ?? '';
      _nomorTeleponController.text =
          userData!['nomorTelepon']?.toString() ?? '';
    }
  }

  Future<void> _saveChanges(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'namaLengkap': _fullNameController.text,
          'nomorTelepon': _nomorTeleponController.text,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perubahan berhasil disimpan!')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
        print('Error updating user data: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pengguna tidak ditemukan.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B636E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito-Bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center text fields
          children: [
            TextFormField(
              controller: _nikController,
              decoration: const InputDecoration(labelText: 'NIK'),
              enabled: false,
            ),
            TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              enabled: false,
            ),
            TextFormField(
              controller: _genderController,
              decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
              enabled: false,
            ),
            TextFormField(
              controller: _nomorTeleponController,
              decoration: const InputDecoration(labelText: 'Nomor HP'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await _saveChanges(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
