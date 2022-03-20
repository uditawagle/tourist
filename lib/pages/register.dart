import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/pages/home.dart';
import 'package:tourguide/pages/loginpage.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/logo/flow.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54, BlendMode.darken),
          )),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15, left: 1, right: 1
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "REGISTER",
                    style: GoogleFonts.robotoSlab
                    ( 
                      fontSize: 32, color: Colors.blueGrey[300],
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Full Name",
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, 
                        width: 1
                        ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, width: 1)
                        ),
                        ),
                  ),
                ),
                // SizedBox(height: size.height * 0.03),
                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.symmetric(horizontal: 40),
                //   child: TextField(
                //     decoration: InputDecoration(labelText: "Username"),
                //   ),
                // ),
                SizedBox(height: size.height * 0.04),
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
                      borderSide: BorderSide(
                        color: Colors.white, 
                        width: 1
                        ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, width: 1)
                        ),
                        ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
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
                      borderSide: BorderSide(
                        color: Colors.white, 
                        width: 1
                        ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, width: 1)
                        ),
                        ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.07),
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
                    child: Text("Register",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: Colors.blueGrey,
                      side: BorderSide(color: Colors.black, width: 1),
                      elevation: 20,
                      minimumSize: Size(150, 50),
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()))
                      },
                      child: Text(
                        "Already Have an Account?? Login",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                height: 35,
              ),
              Text('- - - - - - - - - - - - OR Login With - - - - - - - - - - ',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
              SizedBox(
                height: 30,
              ),
              Button1(
                link: "https://www.facebook.com/",
                title: "Login With Facebook",
                icon: Icons.facebook,
              ),
              SizedBox(
                height: 20,
              ),
              Button1(
                link: "https://www.google.com/",
                title: "Login With Google",
                icon: Icons.g_mobiledata_outlined,
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
