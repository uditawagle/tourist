import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/everest.dart';

class GokyoTrek extends StatefulWidget {
  const GokyoTrek({Key? key}) : super(key: key);

  @override
  State<GokyoTrek> createState() => _GokyoTrekState();
}

class _GokyoTrekState extends State<GokyoTrek> {
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
            image: 'assets/people/gokyo.jpg',
          ),
          PeopleDetails(image: 'assets/people/gokyopeople.jpg'),
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
                      PlaceDetail(text: 'Starts and Ends at: Lukla'),
                      PlaceDetail(text: 'Max Altitude: 4800 m / 15655 ft (Kyanjing Ri)'),
                      PlaceDetail(text: 'Trek Region: Everest'),
                      PlaceDetail(text: 'Difficulty: Moderate, yet Challeging'),
                      PlaceDetail(text: 'Trip Cost:  dollar 1237 USD'),
                      PlaceDetail(text: 'Best Season: Spring/Fall'),
                      PlaceDetail(text: 'Max. elevation: 5,400 m (Gokyo Ri)'),
                      PlaceDetail(text: 'Transport: Flight'),
                      PlaceDetail(text: 'Duration: 13-16 days'),
                      PlaceDetail(text: 'Accomodation: Teahouse '),
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
                      'Gokyo Lake Trek',
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
                            'North-Easter Sagarmatha Zone, Nepal',
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
                        'Trekking to the six glacial-fed Gokyo Lakes, trekkers can include a climb to the top of Gokyo Ri, which is at the same altitude as Everest Base Camp. From the summit, you will enjoy spectacular views of Everest and other very high mountains and glaciers. View the sunrise/sunset view at Mount Everest and other peaks from Gokyo Ri (5357 meters). Explore one of the biggest glaciers in the Khumbu region- the Ngozumpa glacier. Walkthrough the peaceful, off the beaten-paths of the Everest region to reach Gokyo valley.',
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
                                    "https://www.kimkim.com/c/gokyo-lakes-trek";
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
