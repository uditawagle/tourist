import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/everest.dart';

class Lhotse extends StatefulWidget {
  const Lhotse({Key? key}) : super(key: key);

  @override
  State<Lhotse> createState() => _LhotseState();
}

class _LhotseState extends State<Lhotse> {
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
            image: 'assets/travel/lhotse.jpg',
          ),
          PeopleDetails(image:'assets/people/camppeople.jpg'),
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
                        height: 17,
                      ),
                      PlaceDetail(text: 'First ascent:	18 May 1956'),
                      PlaceDetail(text: 'Easiest route:	glacier/snow/ice climb'),
                      PlaceDetail(text: 'Parent range:	Mahalangur Himal, Himalayas'),
                      PlaceDetail(text: 'Place: 8,516 metres (27,940 ft) above sea level,'),
                      PlaceDetail(text: 'Elevation:	8,516 m (27,940 ft)'),
                      PlaceDetail(text: 'Prominence:	610 m (2,000 ft'),
                      PlaceDetail(text: 'Isolation:	2.66 km (1.65 mi) '),
                      PlaceDetail(text: 'Coordinates: 27°57′42″N 86°56′00″E'),
                      SizedBox(
                        height: 25,
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
                      'Mt. Lhotse',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Khumbu region, Nepal',
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 2,
                            height: 4,
                          ),
                          Text(
                            '5.0',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2, left: 2),
                      child: Text(
                        'Lhotse is the fourth highest mountain in the world at 8,516 metres (27,940 ft), after Mount Everest, K2, and Kangchenjunga. The main summit is on the border between Tibet and the Khumbu region of Nepal. Lhotse forms the apex of the massive horseshoe-shaped arc of the Everest massif. Lhotse Main at 8,516 metres (27,940 ft) above sea level, Lhotse Middle (also known as Lhotse Central I or Lhotse East) at 8,414 m (27,605 ft), ',
                        style: GoogleFonts.nunito(
                          color: Colors.white.withOpacity(1),
                          height: 1.5,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                            text: "Read More..",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    "https://en.wikipedia.org/wiki/Lhotse";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              })),
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