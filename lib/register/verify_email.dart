import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:repair_services_komputer/home/home_screen.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  bool verifyEmail = false;
  Timer? timer;
  bool canResendEmail = false;


  @override
  Widget build(BuildContext context) {
    return verifyEmail ? HomeScreen() : Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verify your email',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We have sent a link to your email. Please click on the link to verify your email.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: canResendEmail ? sendVerificationEmail : null,
              child: Text('Resend Email'),
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              textColor: Colors.blue,
              onPressed: () {
                
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    verifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!verifyEmail) {
      sendVerificationEmail();
      timer = Timer.periodic(Duration(seconds: 5), (timer) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      verifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;
    
    });

    verifyEmail ? timer?.cancel() : null;
  }

  void sendVerificationEmail() async {
   try{

     final user = await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 30));
      setState(() => canResendEmail = true);
  } catch (e) {
    print(e.toString());
  }
  }



}