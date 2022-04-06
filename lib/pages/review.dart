import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/classs/about.dart';
import 'package:tourguide/database.dart';

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
      if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
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

    var dataa = await db.list();
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
      backgroundColor: Color.fromARGB(255, 231, 217, 89),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined, color: Colors.black,
          ),
         onPressed: (){
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
            padding: EdgeInsets.only( top: 15, left: 10, right: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FittedBox(
                    child: Column(
                      children: [
                        CardList(
                          text: "${reviewList[index].text1}",
                          subtextt: "${reviewList[index].subtext1}",
                          image:
                              "${reviewList[index].image1}",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CardList(
                          text: 'Harry', //"${aboutList[index].name}"
                          subtextt: 'This place is very good and enjoyable',
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQDhM3R9W_PCfzh0PFJtIbi7Po-N3oiWnEugQcZU7Zp8y52gaLNvnJmmkNZdzudt9-DbE&usqp=CAU",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CardList(
                          text: 'Harry',
                          subtextt: 'This place is very good and enjoyable',
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaxMe2yElTGY488WR0L7uIkSWKXd9yCx1jnwLFvDXbvbDHMyupkKmcrpnU40q2YHh1uyY&usqp=CAU",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CardList(
                          text: 'Harry',
                          subtextt: 'This place is very good and enjoyable',
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS13TsYIZYuW3MKPboL8oGKBtFd7w5zQq0UBISrXbW7XlV2xMM4zlwmIZhBrFt5bu0dCXs&usqp=CAU",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CardList(
                          text: 'Harry',
                          subtextt: 'This place is very good and enjoyable',
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4GJpQd_Y-J40GBUwnnHSW2uknC2AGrRzc1gSpznd00iQwwAu0_4310AHW1M8Nr8mwHac&usqp=CAU",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CardList(
                          text: 'Harry',
                          subtextt: 'This place is very good and enjoyable',
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR657Vfe6WMZ2Z-b6evuAjShGifx0udvpMOJGffnTSQOTL2E0bs82YFlsjxlhT707Nal14&usqp=CAU",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
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
        color: Colors.white,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Color(0x802196F3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtextt,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 180,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.network(image,
                    width: 20, height: 5, fit: BoxFit.contain),
              ),
            ),
          ],
        ));
  }
}
