import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:repair_services_komputer/login_screen.dart';
import 'package:repair_services_komputer/home/home_screen.dart';
import 'package:repair_services_komputer/register/verify_email.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
           return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return VerifyEmail();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}


  


