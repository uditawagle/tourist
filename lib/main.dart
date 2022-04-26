import 'package:flutter/material.dart';
import 'package:tourguide/Screen/splash.dart';
import 'package:tourguide/pages/loginpage.dart';
import 'package:tourguide/worldclock.dart/chooselocation.dart';
import 'package:tourguide/worldclock.dart/home.dart';

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
      home: Login(),
      routes: {
      '/home': (context) => const Home(),
      '/location':(context) => const ChooseLocation(),
    },
    );
  }
}