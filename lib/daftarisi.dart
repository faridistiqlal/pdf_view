import 'package:flutter/material.dart';
import 'package:pdf_view/pdfview.dart';

import 'flipbook.dart';

class DaftarIsi extends StatefulWidget {
  const DaftarIsi({super.key});

  @override
  State<DaftarIsi> createState() => _DaftarIsiState();
}

class _DaftarIsiState extends State<DaftarIsi> {
  List<Map<String, String>> disciplineList = [
    {'code': 'A', 'title': 'Prinsip Dasar', 'page': '5'},
    {'code': 'B', 'title': 'Dasar Hukum', 'page': '6'},
    {'code': 'C', 'title': 'Pengertian', 'page': '7'},
    {'code': 'D', 'title': 'Kewajiban dan Larangan', 'page': '9'},
    {
      'code': 'E',
      'title': 'Perijinan dan Pelaporan Perkawinan-Perceraian',
      'page': '14'
    },
    {'code': 'F', 'title': 'Tingkat dan Jenis Hukuman Disiplin', 'page': '18'},
    {'code': 'G', 'title': 'Jenis Pelanggaran dan Hukuman', 'page': '21'},
    {'code': 'H', 'title': 'Pejabat Yang Berwenang Menghukum', 'page': '24'},
    {
      'code': 'I',
      'title': 'Pejabat Lain Yang Setara dan Pejatuhan Hukdis oleh PyBM',
      'page': '29'
    },
    {
      'code': 'J',
      'title':
          'Tata cara pemanggilan, pemeriksaan, penjatuhan, dan penyampaian keputusan hukuman disiplin',
      'page': '31'
    },
    {'code': 'K', 'title': 'Berlakunya Hukuman Disiplin', 'page': '40'},
    {
      'code': 'L',
      'title':
          'Hapusnya kewajiban menjalani hukuman disiplin dan hak-hak Kepegawaian',
      'page': '41'
    },
    {'code': 'M', 'title': 'Penghentian Pembayaran Gaji', 'page': '43'},
    {
      'code': 'N',
      'title': 'Pendokumentasian Keputusan Hukuman Disiplin',
      'page': '45'
    },
    {
      'code': 'O',
      'title':
          'Pelanggaran Kewajiban Masuk Kerja dan Tidak Menaati Ketentuan Jam Kerja',
      'page': '46'
    },
    {'code': 'P', 'title': 'Ketentuan Lain-lain', 'page': '48'},
    {'code': 'Q', 'title': 'Ketentuan Penutup', 'page': '49'},
    {
      'code': 'R',
      'title': 'Contoh-contoh Kasus Pelanggaran Disiplin',
      'page': '51'
    },
  ];
  List<Map<String, String>> filteredDisciplineList = [];
  @override
  void initState() {
    super.initState();
    filteredDisciplineList = disciplineList;
  }

  void filterDisciplineList(String query) {
    setState(() {
      // Filter the list based on the query
      filteredDisciplineList = disciplineList
          .where((item) =>
              item['code']!.toLowerCase().contains(query.toLowerCase()) ||
              item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Daftar isi',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFfdede9),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/MyWebViewPage');

        //     },
        //     icon: const Icon(
        //       Icons.menu_book,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: TextField(
              onChanged:
                  filterDisciplineList, // Call the filtering function when the text changes
              decoration: const InputDecoration(
                hintText: 'Cari disini...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDisciplineList.length,
              itemBuilder: (context, index) {
                final item = filteredDisciplineList[index];
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 7.0),
                      ],
                    ),
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, '/PDFViewPage');
                          final pageNumber = int.tryParse(item['page'] ?? '');
                          if (pageNumber != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewPage(
                                  pdfPath: 'assets/pdf/panduan.pdf',
                                  pageNumber: pageNumber - 1,
                                  title: item['title']!,
                                ),
                              ),
                            );
                          }
                        },
                        child: ListTile(
                          leading: Text(
                            item['code']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          title: Text(item['title']!),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
