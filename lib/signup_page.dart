import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pkl_satunadi/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: SignUpPage(),
    ),
  );
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late Color myColor;
  late Size mediaSize;
  bool isPasswordVisible = false;
  bool isRepeatPasswordVisible = false;

  final _nikController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? selectedGender;
  final List<String> genderOptions = ['Laki-Laki', 'Perempuan'];

  @override
  void dispose() {
    _nikController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    //auth user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //add user details
      await addUserDetails(
        _nikController.text.trim(),
        _nameController.text.trim(),
        selectedGender!,
        int.parse(_phoneController.text.trim()),
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _repeatPasswordController.text.trim(),
      );

      // Navigate to HomePage
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  Future addUserDetails(
      String nik,
      String namaLengkap,
      String gender,
      int nomorTelepon,
      String email,
      String password,
      String ulangiPassword) async {
    await FirebaseFirestore.instance.collection('users').add({
      'NIK': nik,
      'namaLengkap': namaLengkap,
      'gender': gender,
      'nomorTelepon': nomorTelepon,
      'email': email,
      'password': password,
      'ulangiPassword': ulangiPassword,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _repeatPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    myColor = const Color.fromARGB(255, 255, 255, 255);
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: myColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Daftar',
              style: TextStyle(
                fontFamily: 'Nunito-Bold',
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            pinned: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/logo_satunadi.png",
                        width: 350,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                Card(
                  color: const Color(0xFFE1F0EA),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: _buildForm(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Selamat Datang",
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Color(0xFF053A32),
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildRichText(),
        const SizedBox(height: 20),
        _buildGreyText("NIK"),
        _buildInputField(_nikController),
        const SizedBox(height: 20),
        _buildGreyText("Nama Lengkap"),
        _buildInputField(_nameController),
        const SizedBox(height: 20),
        _buildGreyText("Jenis Kelamin"),
        _buildDropdownField(),
        const SizedBox(height: 20),
        _buildGreyText("Nomor Telepon"),
        _buildInputField(_phoneController),
        const SizedBox(height: 20),
        _buildGreyText("Email"),
        _buildInputField(_emailController),
        const SizedBox(height: 20),
        _buildGreyText("Password"),
        _buildInputField(_passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildGreyText("Ulangi Password"),
        _buildInputField(_repeatPasswordController, isPassword: true),
        const SizedBox(height: 40),
        _buildLoginButton(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Nunito-Bold',
        color: Color(0xFF053A32),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !isPasswordVisible : false,
      style: const TextStyle(
        fontFamily: 'Nunito-Bold',
      ),
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      items: genderOptions
          .map((gender) => DropdownMenuItem<String>(
                value: gender,
                child: Text(
                  gender,
                  style: const TextStyle(
                    fontFamily: 'Nunito-Bold',
                  ),
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedGender = value!;
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        await signUp();
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: const Size.fromHeight(50),
        backgroundColor: const Color(0xFF3B636E),
      ),
      child: const Text(
        "Daftar",
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Nunito-Bold',
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildRichText() {
    return RichText(
      text: const TextSpan(
        text: 'Silakan daftar dengan melengkapi informasi di bawah ini',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Nunito-Regular',
          color: Color(0xFF053A32),
        ),
      ),
    );
  }
}
