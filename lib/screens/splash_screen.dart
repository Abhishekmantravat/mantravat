
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mantravat_project/main.dart';
import 'package:mantravat_project/screens/Home_screen.dart';
import 'package:mantravat_project/screens/auth/login_screen.dart';
import 'package:mantravat_project/try/login.dart';

import '../api/api.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override

  //  show splash screen wait 2 second
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

// check user is login or not if login go to home page
      if (Api.auth.currentUser != null) {
        // log('\nUser: ${Api.auth.currentUser}' as num);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Homescreen()));
//  if not login go to login page
      } else{
        (Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Homescreen())));
      // navigate to next screen
}
      //  (Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (_) => loginscreen())));
    });

  }
  

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('images/comment.png')),
        Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: const Text(
              "made by UP ❤️",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: Colors.black87, letterSpacing: .5),
            )),
      ]),
    );
  }
}
