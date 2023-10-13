import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpref/first.dart';
import 'package:sharedpref/login.dart';
// import 'package:shared_prefrence_sample/splash_scren.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash_screen(),
  ));
}

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => splash_screnState();
}

class splash_screnState extends State<splash_screen> {
  static const String KEYLOGIN = 'login';
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Messenger',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();
    var isLogged = sharePref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if (isLogged != null) {
        if (isLogged) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => first(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => login(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => login(),
            ));
      }
    });
  }
}
