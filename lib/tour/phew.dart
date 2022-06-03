import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/everest.dart';

class PhewaLake extends StatefulWidget {
  const PhewaLake({Key? key}) : super(key: key);
  @override
  State<PhewaLake> createState() => _PhewaLakeState();
}

class _PhewaLakeState extends State<PhewaLake> {
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
            image: 'assets/travel/phewa.jpg',
          ),
          PeopleDetails(image: 'assets/people/phewapeople.jpg'),
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
                      PlaceDetail(text: 'Location: Kaski'),
                      PlaceDetail(text: 'Altitude: 742 m (2,434 ft)'),
                      PlaceDetail(text: 'Lake type: Freshwater'),
                      PlaceDetail(
                          text: 'Catchment area:	122.53 km2 (47.31 sq mi)'),
                      PlaceDetail(
                          text:
                              'Primary inflows:	Harpan, Adheri khola & Phirke Khola'),
                      PlaceDetail(text: 'Max. depth:	24 m (79 ft)'),
                      PlaceDetail(text: 'Max. length:	4 km (2.5 mi)'),
                      PlaceDetail(text: 'Average depth:	8.6 m (28 ft)'),
                      PlaceDetail(text: 'Surface area: 5.7260 km2 (2.2 sq mi)'),
                      PlaceDetail(text: 'Surface elevation: 742 m (2,434 ft)'),
                      PlaceDetail(
                          text: 'Water Volume: 0.046 km3 (0.011 cu mi)'),
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
                      'Phewa Lake',
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
                            'Pokhara, Nepal',
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
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                            height: 4,
                          ),
                          Text(
                            '4.0',
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
                        'Phewa Lake is the second largest lake in Nepal. It is a semi-natural freshwater lake enveloped by rani ban or queens forest and stunning reflection of the Annapurna and Dhaulagiri mountain ranges in the clear lake waters. It is also a perfect place to experience the ever so glorious Himalayan sunrises. It has some religious significance too as it is known for the sacred Tal Barahi Temple located on an island in the lake. Baidam or lakeside of Pokhara on the eastern part has some amazing lodges, restaurants, cafes and bookshops.',
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
                                    "https://en.wikipedia.org/wiki/Phewa_Lake";
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
