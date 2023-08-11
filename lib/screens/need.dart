import 'package:flutter/material.dart';
import 'package:quran/backPage.dart';

class needQuran extends StatefulWidget {
  const needQuran({super.key});

  @override
  State<needQuran> createState() => _needQuranState();
}

class _needQuranState extends State<needQuran> {
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
                          'NEED TO KNOW',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/mim.png',
                        height: 30,
                      ),
                      title: const Text(
                        'Compulsory stop - Otherwise\nMeaning is Changed',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/ain.png',
                        height: 30,
                      ),
                      title: const Text(
                        'Stop - End of a section',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/ta.png',
                        height: 30,
                      ),
                      title: const Text(
                        'Should stop - End of a sentence',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/jim.png',
                        height: 30,
                      ),
                      title: const Text(
                        'Can stop or continue',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/lamAlif.jpg',
                        height: 30,
                      ),
                      title: const Text(
                        'Better not to stop',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/qaf.png',
                        height: 30,
                      ),
                      title: const Text(
                        'It is better not to stop',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/qf.jpg',
                        height: 30,
                      ),
                      title: const Text(
                        'Better to stop',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/za.png',
                        height: 30,
                      ),
                      title: const Text(
                        'Must continue, can take a breath',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/suaad.png',
                        height: 30,
                      ),
                      title: const Text(
                        'Must continue, can take a breath',
                        style: _textcolor,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/needIcons/sulam.jpg',
                        height: 30,
                      ),
                      title: const Text(
                        'Better to continue but permissible to stop',
                        style: _textcolor,
                      ),
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
