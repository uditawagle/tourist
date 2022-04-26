import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/database.dart';
import 'package:tourguide/pages/home.dart';
import 'package:tourguide/pages/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DatabaseService db = DatabaseService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validator() async {
    if (password.text == '' || email.text == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Please provide required field!", 
        style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600, color: Colors.brown))),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Sucessfully login",
         style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600, color: Colors.brown))),
      );
      var res = await db.insertlogin(email.text, password.text);
      print("${res}ressss");
    }

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print('Page not found');
    }
  }

  final white = Colors.white;
  final _passwordFocusNode = FocusNode();
  bool hidePassword = true;
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
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
                  height: 20,
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
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    autofocus: true,
                    controller: email,
                    onSaved: (newValue) {
                      print("email: $newValue");
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please type your email';
                      }

                      return null;
                    },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: white,
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      hintStyle: TextStyle(
                        color: white,
                      ),
                      prefixIcon: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    maxLines: 1,
                    obscureText: hidePassword,
                    focusNode: _passwordFocusNode,
                    controller: password,
                    onSaved: (newValue) {
                      print("Password: $newValue");
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      if (value.length < 4) {
                        return 'password must be at least 4 characters';
                      }

                      return null;
                    },
                    style: TextStyle(
                      color: white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      hintStyle: TextStyle(
                        color: white,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_open_outlined,
                        color: Colors.white54,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white70,
                        ),
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
                      validator();
                    },
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
                Text(
                  '- - - - - - - - - - - - OR Login With - - - - - - - - - - ',
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
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
