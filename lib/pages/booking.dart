import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tourguide/database.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DatabaseService db = DatabaseService();
  TextEditingController name = new TextEditingController();
  TextEditingController checkin = new TextEditingController();
  TextEditingController checkout = new TextEditingController();
  TextEditingController roomneeded = new TextEditingController();
  TextEditingController adult = new TextEditingController();
  TextEditingController child = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/hotel/book.jpg',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueGrey, width: 1),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 33, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Book Hotel',
                      style: GoogleFonts.tradeWinds(
                          color: Color.fromARGB(255, 20, 47, 70),
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Book - Sit - Relax & Enjoy',
                          textStyle: TextStyle(
                            color: Color.fromARGB(255, 59, 6, 28),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Text(
                    'Where do you wanna go?',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 41, 72, 87)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 400,
                    // height: 40,
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field value is requried";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Hotel Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Check-In:',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 41, 72, 87)),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: checkin,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today_outlined, color: Colors.black,),
                        labelText: 'Select Date', 
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                          context: context, 
                          initialDate: DateTime.now(), 
                          firstDate: DateTime(2022), 
                          lastDate: DateTime(2033)
                          );
                          if(pickeddate != null){
                            setState(() {
                              checkin.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                      },
                    ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Check-Out:',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 41, 72, 87)),
                  ),
                  SizedBox(height: 10),
                   SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: checkout,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today_outlined, color: Colors.black,),
                        labelText: 'Select Date', 
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                          context: context, 
                          initialDate: DateTime.now(), 
                          firstDate: DateTime(2022), 
                          lastDate: DateTime(2033)
                          );
                          if(pickeddate != null){
                            setState(() {
                              checkout.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                      },
                    ),
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Room:',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 41, 72, 87)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: roomneeded,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field value is requried";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Room Needed',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Guest:',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 41, 72, 87)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            controller: adult,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Field value is requried";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter Adult Number',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            controller: child,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Field value is requried";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter Child Number',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (name.text == '' || roomneeded.text == '' ||
                            adult.text == '' ||
                            child.text == '') {
                          _showDialogEmptyBooking();
                        } else if (checkin.text == '') {
                          _showDialogEmptyBooking();
                        } else if (checkout.text == '') {
                          _showDialogEmptyBooking();
                        } else {
                          var res = await db.insertbooking(
                              name.text,
                              checkin.text,
                              checkout.text,
                              roomneeded.text,
                              adult.text,
                              child.text);
                          print("${res}ressss");

                          if (res == 200) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  "Booking is confirmed",
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
                      child: Text(
                        'Book',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 103, 143, 163),
                        onPrimary: Colors.black,
                        minimumSize: Size(220, 50),
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showDialogEmptyBooking() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Message",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            content: Text(
              "Enter Required Field",
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
