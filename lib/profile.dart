import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pkl_satunadi/edit_profile.dart';

const String tProfileImage = "assets/male.png";

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  File? _image;
  String? profileImageUrl;
  User? currentUser;
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await _getUserData();
    }
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
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          profileImageUrl = userDoc.get('profileImageUrl');
          // Pastikan nama field yang diambil sesuai dengan yang ada di Firestore
          // Contoh pengambilan data untuk field lainnya
          // userProfile['NIK'] atau userProfile['fullName'], dll.
        });
      } else {
        print("Dokumen pengguna tidak ditemukan.");
      }
    } catch (e) {
      print("Error mengambil data pengguna: $e");
    }
  }

  void navigateToEditProfile() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );
    if (result != null) {
      await _getUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Inisialisasi ScreenUtil di dalam build method
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Profil',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              height: 1.5,
            ),
          ),
        ),
      ),
      body: currentUser == null
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<DocumentSnapshot?>(
              future: _getUserDataFuture(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(child: Text('Profil pengguna tidak ditemukan'));
                }

                var userProfile = snapshot.data!;

                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(
                        30)), // Menggunakan ScreenUtil untuk mengatur padding
                    child: Column(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(120),
                          height: ScreenUtil().setWidth(120),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(100)),
                            child: profileImageUrl == null
                                ? Image.asset(tProfileImage)
                                : Image.network(
                                    profileImageUrl!,
                                    errorBuilder: (context, error, stackTrace) {
                                      print('Error loading image: $error');
                                      return Image.asset(
                                          tProfileImage); // Gunakan gambar placeholder jika terjadi error
                                    },
                                  ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setWidth(16)),
                        ProfileDetailColumn(
                          title: 'NIK',
                          value: userProfile.get('NIK') ?? '',
                        ),
                        ProfileDetailColumn(
                          title: 'Nama Lengkap',
                          value: userProfile.get('fullName') ?? '',
                        ),
                        SizedBox(height: ScreenUtil().setWidth(12)),
                        ProfileDetailColumn(
                          title: 'Email',
                          value: userProfile.get('email') ?? '',
                        ),
                        SizedBox(height: ScreenUtil().setWidth(12)),
                        ProfileDetailColumn(
                          title: 'Jenis Kelamin',
                          value: userProfile.get('gender') ?? '',
                        ),
                        SizedBox(height: ScreenUtil().setWidth(12)),
                        ProfileDetailColumn(
                          title: 'Nomor HP',
                          value: userProfile.get('nomorTelepon') ?? '',
                        ),
                        SizedBox(height: ScreenUtil().setWidth(25)),
                        SizedBox(
                          width: ScreenUtil().setWidth(200),
                          child: ElevatedButton(
                            onPressed: navigateToEditProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              side: BorderSide.none,
                              shape: StadiumBorder(),
                            ),
                            child: Text(
                              "Edit Profil",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setWidth(12)),
                        Divider(),
                        SizedBox(height: ScreenUtil().setWidth(12)),
                        SizedBox(
                          width: ScreenUtil().setWidth(200),
                          child: GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushNamed(context, '/');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(12)),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().setWidth(100)),
                              ),
                              child: Text(
                                "Keluar",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<DocumentSnapshot?> _getUserDataFuture() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
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
          horizontal: ScreenUtil().setWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(
                  16), // Menggunakan ScreenUtil untuk mengatur ukuran teks
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: ScreenUtil().setSp(
                    16), // Menggunakan ScreenUtil untuk mengatur ukuran teks
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nikController,
              decoration: InputDecoration(labelText: 'NIK'),
            ),
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Jenis Kelamin'),
            ),
            TextFormField(
              controller: _nomorTeleponController,
              decoration: InputDecoration(labelText: 'Nomor HP'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Ulangi Password'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _updateProfile();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfile() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .update({
          'NIK': _nikController.text.trim(),
          'fullName': _fullNameController.text.trim(),
          'email': _emailController.text.trim(),
          'gender': _genderController.text.trim(),
          'nomorTelepon': _nomorTeleponController.text.trim(),
          // Pastikan untuk tidak menyimpan password langsung di Firestore
        });
        Navigator.pop(context, true); // Kembali ke halaman profil
      }
    } catch (e) {
      print('Error updating profile: $e');
      // Tampilkan pesan kesalahan kepada pengguna jika diperlukan
    }
  }
}
