import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/backPage.dart';
import 'package:quran/screens/info.dart';
import 'package:quran/screens/need.dart';
import 'package:quran/screens/para.dart';
import 'package:quran/screens/resume.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/utils/about.dart';
import 'package:quran/utils/privacy.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  bool isVolume = true;
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset('assets/Quran.pdf', 'Quran.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const backPage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'HOLY QURAN',
                            style: GoogleFonts.playfairDisplay(
                                fontSize: 18, color: Colors.amber),
                            //TextStyle(fontSize: 18, color: Colors.white60),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            showAnimatedDialog(
                                context: context,
                                barrierDismissible: true,
                                animationType:
                                    DialogTransitionType.slideFromTop,
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(milliseconds: 100),
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 120,
                                        right: 30,
                                        bottom: 380,
                                        top: 80),
                                    child: Material(
                                      color: Colors.white70,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.arrow_back,
                                                color: Colors.black),
                                          ),
                                          ListTile(
                                            title: const Text('Share This App'),
                                            onTap: () async {
                                              await FlutterShare.share(
                                                  title: 'Share To',
                                                  text: 'Share To');
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Privacy Policy'),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const privacyPage()));
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('About'),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const aboutPage()));
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Quit'),
                                            onTap: () {
                                              exit(0);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white60,
                          ),
                          tooltip: 'more',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 260,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.zero,
                        ),
                        border: Border.all(color: Colors.white60)),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/Icons/quran.png',
                        height: 30,
                        width: 28,
                      ),
                      title: Text(
                        'RESUME',
                        style: GoogleFonts.playfairDisplay(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    resumePage(path: pathPDF)));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.zero,
                        ),
                        border: Border.all(color: Colors.white60)),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/Icons/surah.png',
                        height: 30,
                        width: 30,
                      ),
                      title: Text(
                        'PARA Index',
                        style: GoogleFonts.playfairDisplay(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const paraPage()));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.zero,
                        ),
                        border: Border.all(color: Colors.white60)),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/Icons/quran_02.png',
                        height: 30,
                      ),
                      title: Text(
                        'Need to Know',
                        style: GoogleFonts.playfairDisplay(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const needQuran()));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.zero,
                        ),
                        border: Border.all(color: Colors.white60)),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/Icons/quran_02.png',
                        height: 30,
                      ),
                      title: Text(
                        'Info.about QURAN',
                        style: GoogleFonts.playfairDisplay(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const infoQuran()));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isVolume = !isVolume;
                          });
                        },
                        icon: isVolume
                            ? const Icon(
                                Icons.volume_off,
                                color: Colors.white60,
                              )
                            : const Icon(
                                Icons.volume_up,
                                color: Colors.white60,
                              ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 260),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white30),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white60,
                                            Colors.black26,
                                            Colors.white60,
                                          ]),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Holy Quran (Read Free)',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Transform.rotate(
                                            angle: 150,
                                            child: Image.asset(
                                              'assets/Icons/quran_02.png',
                                              height: 80,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  exit(0);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black12),
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                '<|Exit|>',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black12),
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black87,
            title: Text(
              'HOLY QURAN',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),

        //
        ClassicGeneralDialogWidget(
                                    titleText: 'List',
                                    contentText: 'describe',
                                    onPositiveClick: () {
                                      Navigator.of(context).pop();
                                    },
                                    onNegativeClick: () {
                                      Navigator.of(context).pop();
                                    },
                                  );
        */