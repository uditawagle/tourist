import 'package:flutter/material.dart';

class Hotels extends StatefulWidget {
  const Hotels({ Key? key }) : super(key: key);

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              tileColor: Colors.grey[200],
              leading: Image(
                image: AssetImage("assets/hotel.png"
                ),
                height: 100.0,
                width: 400.0,
              ),
              title: Text(
                'Sunrise Moon Beam Hotel',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Shin Chan is a Japanese manga series written and illustrated by Yoshito Usui which follows the adventures of the five-year-old Shinnosuke.',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}