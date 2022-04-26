import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BhaktapurDetail extends StatefulWidget {
  const BhaktapurDetail({ Key? key }) : super(key: key);

  @override
  State<BhaktapurDetail> createState() => _BhaktapurDetailState();
}

class _BhaktapurDetailState extends State<BhaktapurDetail> {
  late PageController _pageController;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        _onScroll;
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Details(
            image: 'assets/travel/bhaktapurr.jpg',
          ),
          PeopleDetails(
            image: 'assets/people/bhaktapeople.jpg'
            ),
        ],
      ),
    );
  }
}

class PeopleDetails extends StatelessWidget {
   final String image;

  PeopleDetails({required this.image});

   Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
              0.3,
              0.9
            ], colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Place Desciption:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PlaceDetail(text: 'Smallest District of Nepal'),
                    PlaceDetail(text: 'Province: Bagmati Pradesh'),
                    PlaceDetail(text: 'Area of Bhaktapur: 119 km²'),
                    PlaceDetail(text: 'Latitude and Longitude: 27° 36′ to 27° 44′ N, 85 ° 21′ to 85 ° 21′ E'),
                    PlaceDetail(text: 'Altitude: 1400 m'),
                    PlaceDetail(text: 'Surrounded by: Kavrepalanchwok District in the east, \nKathmandu and Lalitpur District in the west'),
                    PlaceDetail(text: 'Currency: Nepali Rupee '),
                    PlaceDetail(text: 'Temperature Ranges: -3 deg C / 32 deg C'),
                    PlaceDetail(text: 'Population: Approximately 4,30,408. (2021 Nepal Census)'),
                    PlaceDetail(text: 'Agriculture Production: Paddy, Wheat, Corn, Pulse, Millet, Citrus, Guava, Pears, Junar, Haluwabed, Cauliflower, Peas, Beans, Cucumber, and Pumpkin and So on'),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                ),
              ],
            ),
          ),
        ));
  }
}

class PlaceDetail extends StatelessWidget {
  final String text;

  PlaceDetail({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2, left: 2),
      child: Text( 
        text,
      style: GoogleFonts.nunito(
        color: Colors.white.withOpacity(1),
        height: 1.5,
        fontSize: 14,
      ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String image;

  Details({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
              0.3,
              0.9
            ], colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Bhaktapur Durbar Square',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, 
                        size: 15,
                        color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Bhaktapur, Nepal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                        ),
                        SizedBox(width: 40),
                        StarWidget(
                          color: Colors.yellow,
                        ),
                        StarWidget(
                          color: Colors.yellow,
                        ),
                        StarWidget(
                          color: Colors.yellow,
                        ),
                        StarWidget(
                          color: Colors.yellow,
                        ),
                        StarWidget(
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 2,
                          height: 4,
                        ),
                        Text('4.0',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2, left: 2),
                      child: Text('Bhaktapur is also known as Bhadgaun. This city, rich in ancient arts, religious values, fabulous cultural traditions, architectural masterpieces and ancient sculptures, is also known as an open museum. Moreover, the city is also famous as a city of gods. Bhaktapur has a cluster of temples, pagodas, monuments, courtyard, squares. traditional houses, artistic stones, taps, also Buddhist shrines and monasteries built in different times of the history. The existing civilization characterized with Newari life-style and their fabulous traditions and rituals reflected in the day activities is the main attraction point for foreigners for visiting this city.',
                      style: GoogleFonts.nunito(
                        color: Colors.white.withOpacity(1),
                        height: 1.5,
                        fontSize: 14,
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                        text: "Read More..",
                        recognizer: TapGestureRecognizer()..onTap =() async {
                          var url = "https://www.holidaynepal.com/nepal/bhaktapur.html";
                          if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                        }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}

class StarWidget extends StatelessWidget {
  final Color color;
  StarWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3),
      child: Icon(
        Icons.star,
        color: color,
        size: 16,
      ),
    );
  }
}
