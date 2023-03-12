import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repair_services_komputer/login_screen.dart';

class RegisterScreen extends StatefulWidget {

  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 

  Future<void> register() async {
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: _emailController.text,
        password: _passwordController.text,
      );
       Navigator.pushReplacement(
         context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
      ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Email tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  controller: _emailController,
                  
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Password tidak boleh kosong' : null,
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
                    if (_formKey.currentState!.validate()) {
                      register();
                    }
                  },
                  child: Text('Daftar'),
                ),
                SizedBox(height: 10.0),
                RichText(
                  // ignore: prefer_const_constructors
                  text: TextSpan(
                    text: 'Sudah punya akun? ',
                    style: TextStyle(color: Colors.black),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      TextSpan(
                        text: 'Login',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
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
}
