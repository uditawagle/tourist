import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/pages/loginpage.dart';
import 'package:tourguide/pages/register.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo/jun.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'WANT TO TRAVEL PLACES OF NEPAL??',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tradeWinds(
                        fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                'It feels good to be lost in the right direction',
                textStyle: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              ],
              ),
              SizedBox(
                height: 170,
              ),
              Button(
                text: 'Login',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Button(
              text: 'Register',
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const Button({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[200],
            onPrimary: Colors.black,
            minimumSize: Size(220, 55),
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }
}
