import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({ Key? key }) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Center(
          child: ListTile(
            leading: Icon(Icons.feedback_rounded),
            title: Text(
              "Feedback Page",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            heightFactor: 2,
            child: Text("Your's Feedback Counts!!!",
            style: GoogleFonts.lato(fontSize: 23, color: Colors.teal, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Textone(
                //cont: name,
                title: 'Email',
                sectitle: 'Enter your email here',
              ),
              SizedBox(
                height: 7,
              ),
              Textone(
               // cont: contact,
                title: 'Rate us (From 1-10))',
                sectitle: 'Enter your rating here',
              ),
              SizedBox(
                height: 7,
              ),
              Textone(
               // cont: feedbacks,
                title: 'Feedback',
                sectitle: 'Enter your feedback here',
              ),
              SizedBox(
                height: 40,
              ),
              TextButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () async {
                  // if (name.text == '') {
                  //   _showDialogEmptyFeedback();
                  // } else if (contact.text == '') {
                  //   _showDialogEmptyFeedback();
                  // } else if (feedbacks.text == '') {
                  //   _showDialogEmptyFeedback();
                  // } else {
                  //   var res = await db.insertFeedback(
                  //       "1", contact.text, name.text, feedbacks.text);
                  //   print("${res}ressss");

                  //   if (res == 200) {
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) => AlertDialog(
                  //         title: Text(
                  //           "Thankyou for your feedback!!",
                  //           style: TextStyle(
                  //               fontSize: 12,
                  //               color: Colors.green,
                  //               fontStyle: FontStyle.italic),
                  //         ),
                  //       ),
                  //     );
                  //     print("Success");
                  //   } else {
                  //     print("Failure");
                  //   }
                  // }
                },
                icon: Icon(Icons.send, size: 13,),
                label: Text(
                  "Submit",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Textone extends StatelessWidget {
 // final TextEditingController cont;
  final String title;
  final String sectitle;

  Textone({ required this.title, required this.sectitle});

//required this.cont
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 30, right: 30),
      child: TextFormField(
        //controller: cont,
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