import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_profile.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  File? _image; // Variable untuk menyimpan gambar terpilih
  DocumentSnapshot? userProfile;
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      await _uploadImageToStorage(_image!);
    }
  }

  Future<void> _uploadImageToStorage(File image) async {
    // Implementasi fungsi upload gambar ke storage (opsional)
  }

  Future<void> _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          setState(() {
            userProfile = userDoc;
            profileImageUrl = userDoc['profileImageUrl'];
          });
        } else {
          print("User document does not exist.");
        }
      } catch (e) {
        print("Error fetching user data: $e");
      }
    } else {
      print("No user is signed in.");
    }
  }

  void navigateToEditProfile() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );
    if (result != null) {
      _getUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text('User profile not found'));
        }

        var userProfile = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  height: 1.5,
                ),
              ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: _pickImage,
                        child: profileImageUrl == null
                            ? CircleAvatar(
                                maxRadius: 50.0,
                                minRadius: 50.0,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    const AssetImage(tProfileImage),
                              )
                            : CircleAvatar(
                                maxRadius: 50.0,
                                minRadius: 50.0,
                                backgroundImage: NetworkImage(profileImageUrl!),
                              ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userProfile['namaLengkap'] ?? '',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ProfileDetailColumn(
                    title: 'NIK', value: userProfile['NIK'] ?? ''),
                ProfileDetailColumn(
                    title: 'Nama Lengkap',
                    value: userProfile['namaLengkap'] ?? ''),
                ProfileDetailColumn(
                    title: 'Jenis Kelamin', value: userProfile['gender'] ?? ''),
                ProfileDetailColumn(
                    title: 'Email', value: userProfile['email'] ?? ''),
                ProfileDetailColumn(
                    title: 'No HP', value: userProfile['nomorTelepon'] ?? ''),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: navigateToEditProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF61B296),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: 'Nunito-Bold',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetailColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
