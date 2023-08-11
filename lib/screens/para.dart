import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/backPage.dart';

class paraPage extends StatefulWidget {
  const paraPage({super.key});

  @override
  State<paraPage> createState() => _paraPageState();
}

class _paraPageState extends State<paraPage> {
  List<String> pdfAssets = [
    'assets/parawise/1.pdf',
    'assets/parawise/2.pdf',
    'assets/parawise/3.pdf',
    'assets/parawise/4.pdf',
    'assets/parawise/5.pdf',
    'assets/parawise/6.pdf',
    'assets/parawise/7.pdf',
    'assets/parawise/8.pdf',
    'assets/parawise/9.pdf',
    'assets/parawise/10.pdf',
    'assets/parawise/11.pdf',
    'assets/parawise/12.pdf',
    'assets/parawise/13.pdf',
    'assets/parawise/14.pdf',
    'assets/parawise/15.pdf',
    'assets/parawise/16.pdf',
    'assets/parawise/17.pdf',
    'assets/parawise/18.pdf',
    'assets/parawise/19.pdf',
    'assets/parawise/20.pdf',
    'assets/parawise/21.pdf',
    'assets/parawise/22.pdf',
    'assets/parawise/23.pdf',
    'assets/parawise/24.pdf',
    'assets/parawise/25.pdf',
    'assets/parawise/26.pdf',
    'assets/parawise/27.pdf',
    'assets/parawise/28.pdf',
    'assets/parawise/29.pdf',
    'assets/parawise/30.pdf',
  ];

  List<String> pdfPaths = [];

  @override
  void initState() {
    super.initState();
    getAndProcessPDFs();
  }

  Future<void> getAndProcessPDFs() async {
    for (int i = 0; i < pdfAssets.length; i++) {
      String assetPath = pdfAssets[i];
      String filename = 'pdf_$i.pdf';

      try {
        var dir = await getApplicationDocumentsDirectory();
        File file = File("${dir.path}/$filename");
        var data = await rootBundle.load(assetPath);
        var bytes = data.buffer.asUint8List();
        await file.writeAsBytes(bytes, flush: true);

        pdfPaths.add(file.path);
      } catch (e) {
        throw Exception('Error parsing asset file!');
      }
    }

    setState(() {});
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          backPage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView.builder(
              itemCount: pdfPaths.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.zero,
                    ),
                    border: Border.all(color: Colors.white60),
                  ),
                  child: ListTile(
                    title: Text(
                      '                            Para ${index + 1}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onTap: () {
                      String path = pdfPaths[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(pdfPath: path),
                        ),
                      );
                    },
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

class PdfViewerScreen extends StatefulWidget {
  final String pdfPath;
  PdfViewerScreen({required this.pdfPath});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            !isReady
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
            PDFView(
              filePath: widget.pdfPath,
              autoSpacing: true,
              enableSwipe: true,
              pageSnap: true,
              swipeHorizontal: false,
              pageFling: true,
              defaultPage: currentPage!,
              preventLinkNavigation: false,
              onRender: (_pages) {
                setState(() {
                  pages = _pages;
                  isReady = true;
                });
              },
              onError: (e) {
                setState(() {
                  errorMessage = e.toString();
                });
                print(e.toString());
              },
              onPageError: (page, e) {
                setState(() {
                  errorMessage = '$page: ${e.toString()}';
                });
                print('$page: ${e.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              onLinkHandler: (String? uri) {
                print('goto uri: $uri');
              },
              onPageChanged: (int? page, int? total) {
                print('page change: $page/$total');
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ],
        ),
      )
    ]));
  }
}
