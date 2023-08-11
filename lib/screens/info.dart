import 'package:flutter/material.dart';
import 'package:quran/backPage.dart';

class infoQuran extends StatefulWidget {
  const infoQuran({super.key});

  @override
  State<infoQuran> createState() => _infoQuranState();
}

class _infoQuranState extends State<infoQuran> {
  static const TextStyle _textcolor = TextStyle(
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const backPage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.white60),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'INFORMATION ABOUT QURAN',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    const Text(
                      "Describe here some basic information about 'Holy Quran' which will guide you to know about last islamic book."
                      "Being a Muslim you must have some questions in your mind about Quran Shareef and a muslim you must tell these information to your children.",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "What is Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "Holy Quran is the last Islamic book which was verbally revealed by Allah (SWT) to Muhammad (SAW) through the angel Gabriel [Jibrail] (AS).",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many Parts (Para/Siparah) Holy Quran Consists?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      '30',
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many Surah in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      '114',
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many Makki and Madani Surah in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "Makki 86.\nMadani 28.",
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many Sijdah in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "14\n1. Al-A'raf, ayat 206\n2. Ar-Ra'd, ayat 15\n3. An-Nahl, ayat 50\n4. Al Bani-Israel, ayat 109\n5. Maryam, ayat 58\n6 Al-Haii avat 18\n7. Al-Hajj, ayat 77\n8. Al-Furqan, ayat 60\n9. An-Naml, ayat 26\n10. As-Sajdah, ayat 15. 11. Fussilat/Ha-mim, ayat 38\n12. An-Najm, ayat 62\n13. Al-Inshiqaq, ayat 21\n14. Al-'Alaq, ayat 19.",
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many Ayat in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "6236",
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many Raku in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "558",
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many Manzil in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "7",
                      style: _textcolor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many words in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "77,934",
                      style: _textcolor,
                    ),
                    //
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "How many words (Haroof) in Holy Quran?",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const Text(
                      "3,23,670",
                      style: _textcolor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
