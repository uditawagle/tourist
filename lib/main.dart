import 'package:flutter/material.dart';
import 'package:tourguide/Screen/splash.dart';
import 'package:tourguide/tour/choouy.dart';
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
      home: ChoOuy(),
      //home: SplashScreen(),
      routes: {
      '/home': (context) => const Home(),
      '/location':(context) => const ChooseLocation(),
    },
    );
  }
}