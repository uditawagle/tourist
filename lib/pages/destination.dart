import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Destination extends StatefulWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Destination'),
      //   backgroundColor: Colors.teal,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 2),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Places \nWhere do you wanna go??',
              style: GoogleFonts.akayaTelivigala(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Firstbutton(title: 'Famous', 
                  press: (){},
                  ),
                   Firstbutton(title: 'Mountains',
                   press: () {},
                   ),
                   Firstbutton(title: 'Temple Area', 
                  press: (){},
                  ),
                   Firstbutton(title: 'Bungee Jumping',
                   press: () {},
                   ),
                   Firstbutton(title: 'Jungle Safari', 
                  press: (){},
                  ),
                   Firstbutton(title: 'Rafting',
                   press: () {},
                   ),
                  Firstbutton(title: 'Trekking Area', 
                  press: (){},
                  ),
                   Firstbutton(title: 'Lake Area',
                   press: () {},
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Firstbutton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  
  Firstbutton({ required this.title, required this.press});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: TextButton.styleFrom(
        primary: Colors.purple,
      ),
      child: Text( title,
          style: GoogleFonts.exo2(
              color: Colors.black87, fontSize: 16)),
    );
  }
}
