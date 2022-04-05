import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/database.dart';
import 'package:tourguide/pages/forgotpassword.dart';
import 'package:tourguide/pages/home.dart';
import 'package:tourguide/pages/register.dart';
import 'package:url_launcher/url_launcher.dart';


class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
   var confirmPass; 
  
  late final TextEditingController controller;

  DatabaseService db = DatabaseService();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
  _showDialogEmpty() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Message",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            content: Text(
              "Feedback is Empty",
              style: TextStyle(color: Colors.black38, fontSize: 14),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        });
  }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/logo/flow.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            )),
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
                    "LOGIN",
                    style: GoogleFonts.robotoSlab(
                        fontSize: 32,
                        color: Colors.blueGrey[300],
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: email,
                    style: TextStyle(
                      color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Email",
                      hintText: 'my@gmail.com',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1)),
                    ),
                  validator: (String? email){
                  if(email == null || email.isEmpty){
                    return "Field email is requried";
                  }else if(!RegExp(r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$").hasMatch(email)){
                    return "Please enter correct one";
                  }
                  return null;
                },     
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: password,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Password",
                      hintText: '123456789 not this make strong one',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1)),
                    ),
                    obscureText: true,
                    validator: (String? pword){
                  confirmPass = pword;
                  if(pword == null || pword.isEmpty){
                    return "Please Enter New Password";
                  }else if(pword.length <= 6){
                    return "Password should not be less than 6 characters";

                  }
                    _formKey.currentState!.save();
                  return null;
                },
                // onSaved: (String? pword){
                //   model.password = pword!;
                // },
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ElevatedButton(
                  onPressed: () async {
                     if (email.text == '' || password.text == '') {
                    _showDialogEmpty();
                  } else {
                    var res = await db.login(
                      email.text, password.text);
                   // print("${res}ressss");
                    if (res == 200) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Thankyou!!",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      );
                      print("Success");
                    } else {
                      print("Failure");
                    }
                  }
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
                      primary: Colors.blueGrey,
                      side: BorderSide(color: Colors.black, width: 1),
                      elevation: 20,
                      minimumSize: Size(130, 50),
                      // shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()))
                    },
                    child: Text(
                      "Don't You Have an Account?? Sign up",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
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

 

class Button1 extends StatelessWidget {
  final String title;
  final IconData icon;
  final String link;

  Button1({required this.title, required this.icon, 
  required this.link});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: Size(250, 50),
        primary: Colors.black,
        backgroundColor: Color.fromARGB(255, 89, 125, 141),
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      icon: Icon(icon, 
      color: Colors.white,
      size: 35,
      ),
      onPressed: () {},
      label: RichText(
          text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              text: title,
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  var url = link;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                })),
    );
  }
}
