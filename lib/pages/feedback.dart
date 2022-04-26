import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/database.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  DatabaseService db = DatabaseService();
  TextEditingController uid = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController rate  = new TextEditingController();
  TextEditingController  feedbacks= new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: ListTile(
            leading: Icon(Icons.feedback_rounded, color: Colors.white,),
            title: Text(
              "Feedback Page",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade100,
                Colors.grey.shade200,
                Colors.grey.shade300,
                Colors.grey.shade100,
              ]),
        ),
        child: ListView(
          children: [
            Center(
              heightFactor: 2,
              child: Text(
                "Your's Feedback Counts!!!",
                style: GoogleFonts.lato(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                Textone(
                  cont: uid,
                  title: 'User Id',
                  sectitle: 'Enter your user id here',
                ),
                SizedBox(
                  height: 5,
                ),
                Textone(
                  cont: email,
                  title: 'Email',
                  sectitle: 'Enter your email here',
                ),
                SizedBox(
                  height: 5,
                ),
                Textone(
                  cont: rate,
                  title: 'Rate us (From 1-10)',
                  sectitle: 'Enter your rating here',
                ),
                SizedBox(
                  height: 5,
                ),
                Textone(
                  cont: feedbacks,
                  title: 'Feedback',
                  sectitle: 'Enter your feedback here',
                ),
                SizedBox(
                  height: 40,
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(15)),
                    elevation: MaterialStateProperty.all(10),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    if (email.text == '' ) {
                      _showDialogEmptyFeedback();
                    } else if (uid.text == '') {
                      _showDialogEmptyFeedback();
                    }else if (rate.text == '') {
                      _showDialogEmptyFeedback();
                    } else if (feedbacks.text == '') {
                      _showDialogEmptyFeedback();
                    } else {
                      var res = await db.insertfeedback(
                         uid.text,  email.text, rate.text, feedbacks.text);
                      print("${res}ressss");

                      if (res == 200) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Thankyou for your feedback!!",
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
                  },
                  icon: Icon(
                    Icons.send,
                    size: 13,
                  ),
                  label: Text(
                    "Submit",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showDialogEmptyFeedback() {
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
}

class Textone extends StatelessWidget {
  final TextEditingController cont;
  final String title;
  final String sectitle;

  Textone({required this.title, required this.sectitle, required this.cont});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 30, right: 30),
      child: TextFormField(
        controller: cont,
        maxLines: 1,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: title,
            hintText: sectitle),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Field value is requried";
          }
          return null;
        },
      ),
    );
  }
}
