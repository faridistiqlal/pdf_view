import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pdf_view/daftarisi.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return const DaftarIsi(); //masuk halaman login
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: const Color(0xFFffffff),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/image/splash.png', fit: BoxFit.cover),
        ));
  }
}
