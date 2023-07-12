import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_view/pdfview.dart';
import 'package:pdf_view/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light),
  );
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFfdede9),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      routes: <String, WidgetBuilder>{
        '/SplashScreen': (BuildContext context) => const SplashScreen(),
        '/PDFViewPage': (BuildContext context) => const PDFViewPage(
              pdfPath: '',
              pageNumber: 1,
              title: '',
            ),
      },
      home: const SplashScreen(),
    ),
  );
}
