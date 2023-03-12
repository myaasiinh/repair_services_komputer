import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repair_services_komputer/home/home_screen.dart';
import 'package:repair_services_komputer/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  controller: _emailController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  controller: _passwordController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    signIn();
                    
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 10.0),
                RichText(
                  // ignore: prefer_const_constructors
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                    text: 'Belum punya akun? ',
                    style: TextStyle(color: Colors.black),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      TextSpan(
                        text: 'Daftar',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Fluttertoast.showToast(
                        msg: "Login Berhasil",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
      
    } catch (e) {
      print(e.toString());
    }
  }
}
