import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/pages/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/logo/nature.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo/first.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: GoogleFonts.robotoSlab(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 17),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1)),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 17),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1)),
                ),
                obscureText: true,
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: EdgeInsets.symmetric(horizontal: 40,
            //   vertical: 10),
            //   child: TextButton(
            //     onPressed: () {
            //      Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => ForgotPassword()),
            //       );
            //     },
            //     child: Text(
            //     "Forgot your password?",
            //     style: TextStyle(
            //       fontSize: 12,
            //       color:Colors.white60,
            //     ),
            //   ),
            //   ),
            // ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                  primary: Colors.white,
                  side: BorderSide(color: Colors.black, width: 1),
                  elevation: 20,
                  minimumSize: Size(130, 50),
                  // shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            //   child: GestureDetector(
            //     onTap: () => {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => RegisterScreen()))
            //     },
            //     child: Text(
            //       "Don't You Have an Account?? Sign up",
            //       style: TextStyle(
            //           fontSize: 13,
            //           fontWeight: FontWeight.w400,
            //           color: Colors.white70,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
