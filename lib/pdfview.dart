import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PDFViewPage extends StatefulWidget {
  final String pdfPath;
  final int pageNumber;
  const PDFViewPage({
    super.key,
    required this.pdfPath,
    required this.pageNumber,
  });

  @override
  _PDFViewPageState createState() => _PDFViewPageState();
}

class _PDFViewPageState extends State<PDFViewPage> {
  late int pageNumber;
  late String pdfPath;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    pdfPath = widget.pdfPath;
    pageNumber = widget.pageNumber;
    pageNumber = widget.pageNumber;
    loadPDF();
  }

  Future<void> loadPDF() async {
    final tempDir = await getTemporaryDirectory();
    final tempFilePath = '${tempDir.path}/panduan.pdf';

    final byteData = await rootBundle.load('assets/pdf/panduan.pdf');
    final bytes = byteData.buffer.asUint8List();
    final file = await File(tempFilePath).writeAsBytes(bytes);

    setState(() {
      pdfPath = file.path;
      isLoading = false;
    });
  }

  void onPageChanged(int? page, int? total) {
    if (page != null) {
      setState(() {
        pageNumber = page - 1; // Add 1 to adjust for starting from page 0
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: PDFView(
                    filePath: pdfPath,
                    defaultPage: widget.pageNumber,
                    onPageChanged: onPageChanged,
                  ),
                ),
                Text(
                  'Page: $pageNumber',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
    );
  }
}
