import 'package:flutter/material.dart';
import 'package:tourguide/pages/loginpage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/lan.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black54, BlendMode.darken),
        )),
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
            ),
            Text(
              'Forgot Password??',
              style: TextStyle(
                  color: Color.fromARGB(255, 128, 178, 214),
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Please enter your email address:',
              style: TextStyle(
                      color: Color.fromARGB(255, 238, 220, 220),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            ResetForm(),
            SizedBox(
              height: 60,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                  primary: Colors.blueGrey,
                  side: BorderSide(color: Colors.black, width: 1),
                  elevation: 20,
                  minimumSize: Size(180, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 16, 
                  fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class ResetForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 17),
      child: TextFormField(
        style: TextStyle( color: Colors.white),
        decoration: InputDecoration(
            hintText: 'Email',
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                ),
            hintStyle: TextStyle(color: Colors.white),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                ),
                ),
      ),
    );
  }
}
