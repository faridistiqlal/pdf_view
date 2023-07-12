import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HalUtama extends StatefulWidget {
  const HalUtama({super.key});

  @override
  State<HalUtama> createState() => _HalUtamaState();
}

class _HalUtamaState extends State<HalUtama> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'DIPARANIGADIS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFfdede9),
      ),
      body: Stack(children: [
        Stack(
          children: [
            Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height * 0.4,
              decoration: const BoxDecoration(
                color: Color(0xFFfdede9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10 * 3,
                horizontal: 10 * 2,
              ),
              child: Text(
                "Panduan penegakan\ndisiplin PNS",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
              ),
            ),
          ],
        ),
        loginForm(),
      ]),
    );
  }

  Widget loginForm() {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SizedBox(
        child: Container(
      // padding: const EdgeInsets.only(top: defaultPadding * 1),
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.only(top: mediaQueryData.size.height * 0.15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: mediaQueryData.size.height * 0.01,
          right: mediaQueryData.size.height * 0.01,
          // bottom: mediaQueryData.size.height * 0.03,
          top: mediaQueryData.size.height * 0.01,
        ),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                flipBook(),
                daftarIsi(),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget flipBook() {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width * 0.46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.0, 3.0),
              blurRadius: 7.0),
        ],
      ),
      child: Material(
        color: Colors.orange.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/MyWebViewPage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Icon(
                  Icons.menu_book_rounded,
                  color: Colors.orange,
                  size: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQueryData.size.height * 0.01,
                  ),
                ),
                const Text(
                  "FlipBook", //IBADAH
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQueryData.size.height * 0.01,
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Tampilan pdf dengan mode flip buku",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget daftarIsi() {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width * 0.46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.0, 3.0),
              blurRadius: 7.0),
        ],
      ),
      child: Material(
        color: Colors.blue.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/DaftarIsi');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Icon(
                  Icons.list,
                  color: Colors.blue,
                  size: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQueryData.size.height * 0.01,
                  ),
                ),
                const Text(
                  "Daftar isi", //IBADAH
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQueryData.size.height * 0.01,
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Cari halaman yang diinginkan dalam panduan",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
