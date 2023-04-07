import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mantravat_project/helper/dialogs.dart';
import 'package:mantravat_project/screens/Home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mantravat_project/api/api.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  _handleGoogleBtnClick() {
    Dialogs.showProgressBar(context);

    _signInWithGoogle().then((user) async {
      Navigator.pop(context);
      if (user != null) {
        print('/nUser :${user.user}');
      
        print('/nUserAdditionalInfo:${user.additionalUserInfo}');
 Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Homescreen()));
        // if ((await Api.UserExists())) {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (_) => const Homescreen()));
        // } else {
        //   await Api.createUser().then((value) {
        //     Navigator.pushReplacement(
        //         context, MaterialPageRoute(builder: (_) => const Homescreen()));
        //   });
        // }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {      
      await InternetAddress.lookup('google.com');

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }catch (e) {
      print('\n_signInWithGoogle: $e');
      Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      return null;
    }
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Image.asset(
                  'images/google.png',
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 80),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 139, 164, 206),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Homescreen()));
                      _handleGoogleBtnClick();
                    },
                    icon: Image.asset(
                      'images/google.png',
                      width: 25,
                      height: 25,
                    ),
                    label: Text(
                      'Google Sign-in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
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
