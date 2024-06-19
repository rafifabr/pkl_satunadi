import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: LoginPage(),
    ),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = const Color.fromARGB(255, 255, 255, 255);
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myColor,
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                  centerTitle: true,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/logo_satunadi.png",
                    width: 350,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: mediaSize.width,
              child: Card(
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
        const SizedBox(height: 60),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
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
      obscureText: isPassword,
      style: const TextStyle(
        fontFamily: 'Nunito-Bold',
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        try {
          // ignore: unused_local_variable
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          // If login is successful, navigate to HomePage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } on FirebaseAuthException catch (e) {
          // Show error message if login fails
          if (e.code == 'user-not-found') {
            showErrorDialog('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            showErrorDialog('Wrong password provided.');
          } else {
            showErrorDialog('Something went wrong. Please try again.');
          }
        } catch (e) {
          showErrorDialog('An error occurred. Please try again.');
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(50),
        backgroundColor: const Color(0xFF3B636E),
      ),
      child: const Text(
        "Masuk",
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Nunito-Bold',
          color: Colors.white,
        ),
      ),
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRichText() {
    return RichText(
      text: const TextSpan(
        text: 'Silakan masuk dengan melengkapi informasi di bawah ini',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Nunito-Regular',
          color: Color(0xFF053A32),
        ),
      ),
    );
  }
}
