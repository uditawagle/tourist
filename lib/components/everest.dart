import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/classs/language.dart';
import 'package:url_launcher/url_launcher.dart';

class EverestDetail extends StatefulWidget {
  const EverestDetail({Key? key}) : super(key: key);

  @override
  State<EverestDetail> createState() => _EverestDetailState();
}

class _EverestDetailState extends State<EverestDetail> {
  late PageController _pageController;

  void _changeLanguage(Object? language) {}
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          DropdownButton(
            onChanged: (language) {
              _changeLanguage(language);
            },
            underline: SizedBox(),
            icon: Icon(
              Icons.language_outlined,
              color: Color.fromARGB(255, 99, 46, 109),
              size: 34,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (lang) => DropdownMenuItem(
                    value: lang,
                    child: Row(
                      children: [Text(lang.name), Text(lang.flag)],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Details(
            image: 'assets/travel/Everest.jpg',
          ),
          PeopleDetails(image: 'assets/people/everestpeople.jpg'),
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
                      PlaceDetail(
                          text: 'Earths Highest Mountain Above Sea Level'),
                      PlaceDetail(text: 'Province: Province No.1'),
                      PlaceDetail(text: 'Height: 8,848.86 m (29,031.7 ft)'),
                      PlaceDetail(text: 'Border Between: Nepal and China'),
                      PlaceDetail(
                          text: 'First Nepali Climber: Pasang Lhamu Sherpa'),
                      PlaceDetail(
                          text:
                              'First Climber: Tenzing Norgay and Edmund Hillary'),
                      PlaceDetail(
                          text: 'Parent Range: Mahalangur Himal, Himalayas'),
                      PlaceDetail(
                          text:
                              'Latitude and Longitude: 27.9881° N, 86.9250° E '),
                      PlaceDetail(text: 'Currency: Nepali Rupee '),
                      PlaceDetail(
                          text:
                              'Temperature Ranges: Average −33 °F (−36 °C) and can drop as low as −76 °F (−60 °C).'),
                      PlaceDetail(text: 'People: Sherpa'),
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
          fontSize: 16,
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
                      'Mount Everest',
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
                        Icon(
                          Icons.location_on,
                          size: 15,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Solukhumbu District, Nepal',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 80),
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2, left: 2),
                      child: Text(
                        'Mount Everest is a peak in the Himalaya mountain range. It is located between Nepal and Tibet. The height of Mount Everest is 8,849 m. Sherpa people is often used to mean mountain guide, though it actually refers to an ethnic group. Climbing Mount Everest has become a popular expedition for mountain climbers. However, Mount Everest is a dangerous and requires a lot of experience mountaineering elsewhere, as well as a certificate of good health, equipment, and a trained Nepalese guide.',
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
                                    "https://www.nationalgeographic.org/encyclopedia/mount-everest/";
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
        size: 18,
      ),
    );
  }
}
