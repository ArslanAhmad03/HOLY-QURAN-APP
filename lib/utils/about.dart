import 'package:flutter/material.dart';
import 'package:quran/backPage.dart';

class aboutPage extends StatelessWidget {
  const aboutPage({super.key});

  static const TextStyle _textcolor = TextStyle(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          backPage(),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HOLY QURAN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Developed by arslan',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'e-mail: arsl2054016@gmail.com',
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Transform.rotate(
                    angle: 150,
                    child: Image.asset(
                      'assets/Icons/quran_02.png',
                      height: 80,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Version : 1.0.0',
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Icon made, Graphics & Designed by\n                       Kamran',
                    style: _textcolor,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Copyright @ 2023 arslan\n   All Rights Reserved',
                    style: _textcolor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
