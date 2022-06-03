import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/everest.dart';

class ParsaNP extends StatefulWidget {
  const ParsaNP({Key? key}) : super(key: key);

  @override
  State<ParsaNP> createState() => _ParsaNPState();
}

class _ParsaNPState extends State<ParsaNP> {
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
            image: 'assets/travel/parsa.jpg',
          ),
          PeopleDetails(image:'assets/people/chit.jpg'),
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
                      PlaceDetail(text: 'Established: 1984 as Wildlife Reserve, 2017 as National Park'),
                      PlaceDetail(text: 'Area: 627.39 km2 (242.24 sq mi)'),
                      PlaceDetail(text: 'Nearest city:	Birgunj'),
                      PlaceDetail(text: 'Buffer Zone (sq.km.): 285.30 (IUCN Category: VI)'),
                      PlaceDetail(text: 'Governing body:	Department of National Parks and Wildlife Conservation'),
                      PlaceDetail(text: 'Coordinates: 27°28′N 84°20′E'),
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
                      'Parsa National Park ',
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
                            'Parsa, Nepal',
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
                        'Parsa National Park is located in the south-central lowland Terai of Nepal. With the area of 637.37 sq.km. it has pristine sub-tropical jungle. In history, this area served as a vacation site for the Rana Rulers of the country. In 1984, it has been gazetted as a wildlife reserve to preserve the habitat for wild Asian elephant and a variety of other fauna. It is contiguous with Chitwan National Park in the west. In 2017 it was gazetted as National Park.',
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
                                    "https://dnpwc.gov.np/en/conservation-area-detail/74/";
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