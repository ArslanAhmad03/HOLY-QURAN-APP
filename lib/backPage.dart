import 'package:flutter/material.dart';

class backPage extends StatelessWidget {
  const backPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backPage.jpg'),
          fit: BoxFit.fill,
        ),
      )),
    );
  }
}
