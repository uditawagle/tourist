import 'package:flutter/material.dart';
import 'package:tourguide/components/hotelyakyeti.dart';
import 'package:tourguide/pages/about_us.dart';
import 'package:tourguide/pages/review.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      home: Review(),
    );
  }
}