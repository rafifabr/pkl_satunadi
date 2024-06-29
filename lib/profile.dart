// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pkl_satunadi/edit_profile.dart';
import 'package:pkl_satunadi/settings_page.dart';

const String tProfileImage = "assets/male.png";

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // File? _image;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        userData = userDoc.data() as Map<String, dynamic>?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(
                right: 50.0), // Tambahkan padding untuk menengah teks
            child: Text(
              'Profil',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                height: 1.5,
                color: Colors.white, // Ubah warna teks menjadi putih
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFF3B636E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ),
      body: userData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                child: Column(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(120),
                      height: ScreenUtil().setWidth(120),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(100)),
                        // child: Image.asset(tProfileImage,
                        //     errorBuilder: (context, error, stackTrace) {
                        //   return Icon(Icons.error);
                        // }),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(16)),
                    ProfileDetailColumn(
                      title: 'NIK',
                      value: userData!['NIK'] ?? 'N/A',
                    ),
                    ProfileDetailColumn(
                      title: 'Nama',
                      value: userData!['namaLengkap'] ?? 'N/A',
                    ),
                    SizedBox(height: ScreenUtil().setWidth(12)),
                    ProfileDetailColumn(
                      title: 'Email',
                      value: userData!['email'] ?? 'N/A',
                    ),
                    SizedBox(height: ScreenUtil().setWidth(12)),
                    ProfileDetailColumn(
                      title: 'Jenis Kelamin',
                      value: userData!['gender'] ?? 'N/A',
                    ),
                    SizedBox(height: ScreenUtil().setWidth(12)),
                    ProfileDetailColumn(
                      title: 'Nomor HP',
                      value: userData!['nomorTelepon']?.toString() ?? 'N/A',
                    ),
                    SizedBox(height: ScreenUtil().setWidth(25)),
                    SizedBox(
                      width: ScreenUtil().setWidth(200),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                userData: userData,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          "Edit Profil",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(12)),
                  ],
                ),
              ),
            ),
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
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setWidth(10),
        horizontal: ScreenUtil().setWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: ScreenUtil().setSp(16),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
