import 'package:flutter/material.dart';
import 'package:quran/backPage.dart';

class surahPage extends StatefulWidget {
  const surahPage({super.key});

  @override
  State<surahPage> createState() => _surahPageState();
}

class _surahPageState extends State<surahPage> {
  static const TextStyle _textcolor = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      backPage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'data',
            style: _textcolor,
          ),
        ),
      )
    ]));
  }
}
