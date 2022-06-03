import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/everest.dart';

class MustangTrek extends StatefulWidget {
  const MustangTrek({Key? key}) : super(key: key);

  @override
  State<MustangTrek> createState() => _MustangTrekState();
}

class _MustangTrekState extends State<MustangTrek> {
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
            image: 'assets/people/mustang.jpg',
          ),
          PeopleDetails(image: 'assets/people/upperpeople.jpg'),
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
                      PlaceDetail(text: 'Starts at: Jomsom'),
                      PlaceDetail(text: 'Max Altitude: 4010 m / 13156 ft (Nyi La Pass)'),                          
                      PlaceDetail(text: 'Trip Grade: Moderate'),
                      PlaceDetail(text: 'Trip Cost:  dollar 1615 USD'),
                      PlaceDetail(text: 'Transport: Flight'),
                      PlaceDetail(text: 'Duration: 14- 15 days'),
                      PlaceDetail(text: 'Accomodation: Teahouses'),
                      PlaceDetail(text: 'Ends at: Jomsom'),
                      PlaceDetail(text: 'Max. elevation: 3820m (Lo Manthang) '),
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
                      'Upper Mustang Trek',
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
                            'North of Annapurna, Nepal',
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
                        'The Upper Mustang trek winds its way to the hidden Buddhist world of the Kingdom of Mustang, also known as Lo. This remote trans-Himalayan mountain area borders Tibet. Spiritual feel walking through many Gompas, chortens, flapping prayer flags, and caves. Breathe the spirituality of the Tibetan like people and monks with their prayer flags. Walk back to the history of Lo Manthang after exploring the palace of king. Lying in the rain shadow of the Himalaya, and officially one of Nepals restricted regions, this trek is known for its desert beauty and harsh, cliff-faced landscapes.',
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
                                  "https://www.magicalnepal.com/trip/upper-mustang-trek/";
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
