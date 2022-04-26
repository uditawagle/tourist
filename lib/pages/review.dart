import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/classs/review.dart';
import 'package:tourguide/database.dart';
import 'package:url_launcher/url_launcher.dart';

class Review extends StatefulWidget {
  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  DatabaseService db = DatabaseService();
  List<Reviews> reviewList = [];
  ScrollController _controller = new ScrollController();

  int offset = 0;

  int currentDataLength = 0;

  @override
  void initState() {
    super.initState();
    fetch(offset);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        if (currentDataLength >= 10) {
          print("List bigger than 10");

          offset = reviewList.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var dataa = await db.rev();
    currentDataLength = dataa.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Reviews p in dataa) {
        reviewList.add(p);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 231, 217, 89),
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.backspace_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Reviews',
            style: GoogleFonts.tradeWinds(
                color: Color.fromARGB(255, 12, 32, 49),
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white
          //elevation: 0,
          ),
      body: ListView.builder(
        controller: _controller,
        itemCount: reviewList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 8, right: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    FittedBox(
                      child: Column(
                        children: [
                          CardList(
                            text: "${reviewList[index].text1}",
                            subtextt: "${reviewList[index].subtext1}",
                            image: "${reviewList[index].image1}",
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CardList(
                            text: "${reviewList[index].text2}",
                            subtextt: "${reviewList[index].subtext2}",
                            image: "${reviewList[index].image2}",
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CardList(
                            text: "${reviewList[index].text3}",
                            subtextt: "${reviewList[index].subtext3}",
                            image: "${reviewList[index].image3}",
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CardList(
                            text: "${reviewList[index].text4}",
                            subtextt: "${reviewList[index].subtext4}",
                            image: "${reviewList[index].image4}",
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CardList(
                            text: "${reviewList[index].text5}",
                            subtextt: "${reviewList[index].subtext5}",
                            image: "${reviewList[index].image5}",
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CardList(
                            text: "${reviewList[index].text6}",
                            subtextt: "${reviewList[index].subtext6}",
                            image: "${reviewList[index].image6}",
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15
                    ),
                    OutlinedButton(
                      onPressed: () {}, 
                      child: RichText(
                            text: TextSpan(
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "View More Review",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    "https://www.kimkim.com/d/nepal/trip-reviews/";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              })),
                      ),
                       SizedBox(
                      height: 15
                    ),
                  ],
                  
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final String text;
  final String subtextt;
  final String image;

  CardList({required this.text, required this.subtextt, required this.image});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black87,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.teal[400],
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 2),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          subtextt,
                          style: GoogleFonts.nunito(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.network(image,
                    width: 20, height: 5,
                     fit: BoxFit.contain),
              ),
            ),
          ],
          
        ),
        );
  }
}
