import 'package:flutter/material.dart';
import 'package:tourguide/Screen/splash.dart';
import 'package:tourguide/components/everest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: EverestDetail(),
    );
  }
}