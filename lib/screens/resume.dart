import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class resumePage extends StatefulWidget {
  final String? path;
  const resumePage({super.key, required this.path});

  @override
  State<resumePage> createState() => _resumePageState();
}

class _resumePageState extends State<resumePage> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  int? totalPages = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: false,
            pageFling: true,
            defaultPage: currentPage!,
            preventLinkNavigation: false,
            onRender: (_pages) {
              setState(() {
                totalPages = _pages;
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
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 140, bottom: 10),
                child: Text(
                  currentPage != null && totalPages != null
                      ? 'Page ${currentPage! + 1} of ${totalPages!}'
                      : '',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
