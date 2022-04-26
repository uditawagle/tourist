import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/classs/about.dart';

import '../database.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  DatabaseService db = DatabaseService();
  List<About> aboutList = [];
  ScrollController _scrollController = new ScrollController();

  int offset = 0;

  int currentDataLength = 0;

  @override
  void initState() {
    super.initState();
    fetch(offset);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentDataLength >= 10) {
          print("List bigger than 10");

          offset = aboutList.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.allitem();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (About p in data) {
        aboutList.add(p);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  Widget _buildSeparators(Size screensize) {
    return Container(
      width: screensize.width / 1.2,
      height: 2,
      color: Colors.black,
      margin: EdgeInsets.only(top: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: aboutList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: <Widget>[
            Container(
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${aboutList[index].imagee}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: screenSize.height / 5.3,
                ),
                Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("${aboutList[index].image}"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text("${aboutList[index].name}",
                    style: GoogleFonts.martel(
                      color: Colors.teal,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    )
                    ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "${aboutList[index].status}",
                    style: GoogleFonts.dancingScript(
                      color: Color.fromARGB(255, 4, 2, 27),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white24,
                    padding: EdgeInsets.all(2),
                    child: Text(
                      "${aboutList[index].bio}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white24,
                    padding: EdgeInsets.all(2),
                    child: Text(
                      "${aboutList[index].bioo}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                _buildSeparators(screenSize),
                SizedBox(
                  height: 9,
                ),
              ],
            ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
