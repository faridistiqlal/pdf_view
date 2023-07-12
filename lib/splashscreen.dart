import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pdf_view/daftarisi.dart';

import 'menu_utama.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
              return const HalUtama(); //masuk halaman login
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: const Color(0xFFffffff),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/image/splash.png',
            fit: BoxFit.cover,
          ),
        ));
  }
}
