import 'package:flutter/material.dart';
import 'package:quran/backPage.dart';

class privacyPage extends StatelessWidget {
  const privacyPage({super.key});

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
                          'Privacy Policy',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Text(
                      "Arslan built the HOLY QURAN app as a Free app. This SERVICE is provided by Arslan at no cost and is intended for use as is.",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at HOLY QURAN (Read Free) unless otherwise defined in this Privacy Policy",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Information Collection and Use",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Internet access permission. The information that I request will be retained on your device and is not collected by me in any way",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    ),
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "If you have any questions or suggestions about my App and Privacy Policy, do not hesitate to contact me at arsl@gmail,com",
                      textAlign: TextAlign.justify,
                      style: _textcolor,
                    )
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
