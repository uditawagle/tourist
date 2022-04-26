import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ContactUs(
            avatarRadius: 60,
            dividerColor: Colors.black26,
              cardColor: Colors.blueGrey,
              textColor: Colors.black,
              logo: AssetImage(
                'assets/logo/first.png',
              ),
              email: 'tourguide@gmail.com',
              companyName: 'Tourist Guide App',
              companyColor: Colors.black,
              phoneNumber: '+9876543579',
              tagLine: 'Never too late to Explore places',
              taglineColor: Colors.white,
              facebookHandle: 'Tourist Guide',
              instagram: 'tourist_guide',
              ),
        ),
      ),
    );
  }
}
