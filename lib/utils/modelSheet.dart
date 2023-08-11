import 'dart:io';

import 'package:flutter/material.dart';

class modelPage extends StatefulWidget {
  const modelPage({super.key});

  @override
  State<modelPage> createState() => _modelPageState();
}

class _modelPageState extends State<modelPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 100, right: 5, top: 20, bottom: 250),
        child: Container(
            height: 200,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.zero),
              border: Border.all(),
              color: Colors.white60,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white60),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text('Rate & Feedback'),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text('Share This App'),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text('Privacy Policy'),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text('About'),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text('Quit'),
                    onTap: () {
                      exit(0);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
