import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/components/detailshotel.dart';
import 'package:tourguide/components/hotelyakyeti.dart';
import 'package:tourguide/pages/destination.dart';

class Hotels extends StatefulWidget {
  const Hotels({Key? key}) : super(key: key);

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  final List<String> imageList = [
    'https://th.bing.com/th/id/R.fe57d91420b79a78323916a877cb3596?rik=u45NquoRtuRmHw&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.NBsec7VFedfpl2CnWXSBWwHaEK?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/R.e1213acd00ef42fdb825e9f7e990c39e?rik=AtFxTJ%2fkCLDsyw&riu=http%3a%2f%2fimg.agoda.net%2fhotelimages%2f287%2f287692%2f287692_Main.jpg&ehk=090ZZMPKoyL6E104PPRJ8HjGJcZJQG%2fxYwl%2bC%2fpmn68%3d&risl=&pid=ImgRaw&r=0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Welcome 🙏 \nPick your Destination',
                  style: GoogleFonts.akayaTelivigala(
                    fontSize: 40,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  width: 420,
                  height: 220,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                    ),
                    items: imageList
                        .map(
                          (e) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 165, left: 25, right: 25),
                                  child: Text(
                                    'Its Always Summer Somewhere Else',
                                    style: GoogleFonts.hurricane(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Firstbutton(title: 'Top Deals:'),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ImagePlace(
                      images: 'assets/hotel/yeti.jpg',
                      text: 'Hotel \nYak & \nYeti',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HotelYakYeti()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ImagePlace(
                      images: 'assets/hotel/pavilions.jpg',
                      text: 'The Pavilions \nHimalayas',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Pavilions()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ImagePlace(
                      images: 'assets/hotel/karnali.jpg',
                      text: 'Tiger \nTop \nKarnali \nLodge',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KarnaliLodge()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ImagePlace(
                      images: 'assets/hotel/kathmanduguest.jpg',
                      text: 'Kathmandu \nGuest House',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KathmanduGuest()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ImagePlace(
                      images: 'assets/hotel/tigerlodge.jpg',
                      text: 'Tiger Tops Tharu \nLodge',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TigerTopsTharuLodge()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ImagePlace(
                      images: 'assets/hotel/lastresort.jpg',
                      text: 'The Last \nResort',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LastResort()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Firstbutton(title: 'Best Deals'),
              SizedBox(
                height: 10,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MountainPokhara()),
                  );
                },
                image: 'assets/hotel/tigermountain.jpg',
                text: 'Tiger Mountain Pokhara Lodge',
                subtext: 'Lekhnath, Pokhara',
                ptext:
                    'Perched 1,000 feet above the Pokhara Valley with a spectacular Himalayan backdrop, Tiger Mountain Pokhara Lodge provides a perfect and essence of tranquillity.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GokarnaResort()),
                  );
                },
                image: 'assets/hotel/gokarna.jpg',
                text: 'Gokarna Forest Resort',
                subtext: 'Rajnikunj Gokarna, Thali, 20498 Kathmandu',
                ptext:
                    'Gokarna Forest Resort offers accommodations with breathtaking views of the Gokarna Forest and features a spa and health club.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TulajaHotel()),
                  );
                },
                image: 'assets/hotel/Tulaja.jpg',
                text: 'Tulaja Boutique Hotel',
                subtext: 'Balakhu-10, Bhaktapur',
                ptext:
                    'Tulaja Boutique Hotel is a newly established six-story property situated at Bhaktapur, simply a minute carefree walk from the heart of the Bhaktapur Durbar Square.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EncounterNepalSpa()),
                  );
                },
                image: 'assets/hotel/ktmhot.jpg',
                text: 'Hotel Encounter Nepal & Spa',
                subtext: 'Thamel, Kathmandu',
                ptext:
                    'Hotel Encounter Nepal & Spa is a Nepalese character hotel on the northern edge of Thamel with Low rates Multilingual Staff, online Services, Free cancelation, 100% verified reviews',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GrandShambala()),
                  );
                },
                image: 'assets/hotel/hotelgrand.jpg',
                text: 'Hotel Grand Shambala At Muktinath',
                subtext: 'Ranipauwa 33100, Muktinath Sadak',
                ptext:
                    'Hotel Grand Shambala is situated at the main bazaar of muktinath.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GatewayResort()),
                  );
                },
                image: 'assets/hotel/marsyandi.jpg',
                text: 'Gateway Himalaya Resort',
                subtext: 'Ghanpokhara, Lamjung',
                ptext:
                    'Gateway Himalaya Resort offers 4-star accommodation  with a bar, a garden and a terrace.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelHeritage()),
                  );
                },
                image: 'assets/hotel/heritage.jpg',
                text: 'Hotel Heritage',
                subtext: 'Suryabinayak, 44800 Bhaktapur',
                ptext:
                    'Hotel Heritage is a 7-minute walk from Bhaktapur Durbar Square offering air-conditioned rooms, free wifi, private parking.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeghauliSerai()),
                  );
                },
                image: 'assets/hotel/taj.jpg',
                text: 'Meghauli Serai, A Taj Safari',
                subtext: 'Ward no 1 Narayani Nager Palika, Chitwan',
                ptext:
                    '5-Star Resort Meghauli Serai Chitwan National Park offers you a unique experience into our luxury safari lodge amidst a unique natural ecosystem.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManakamanaResort()),
                  );
                },
                image: 'assets/hotel/manakamana.jpg',
                text: 'Manakamana Fulbari Resort',
                subtext: 'Manakamana, Gorkha',
                ptext:
                    'Manakamana Fulbari Resort provides the best amenities for its guests, wifi, tour desk, banquet space and so on.',
              ),
              SizedBox(
                height: 5,
              ),
              Deals(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChitwanResort()),
                  );
                },
                image: 'assets/hotel/forest.jpg',
                text: 'Chitwan Forest Resort',
                subtext: 'Sauraha, Bachhauli - 2, Chitwan',
                ptext:
                    'Offering traditional bungalows located around a lovely garden, this homely property is located within the tropical landscapes of Chitwan National Park.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Deals extends StatelessWidget {
  final String image;
  final String text;
  final String subtext;
  final String ptext;
  final VoidCallback press;

  Deals(
      {required this.image,
      required this.text,
      required this.subtext,
      required this.ptext,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 6, top: 8),
      child: CardCommon(
        radius: 10,
        child: ClipRect(
          child: AspectRatio(
            aspectRatio: 2.7,
            child: Stack(
              children: [
                Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 0.99,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: press,
                              child: Text(
                                text,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  subtext,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                ptext,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardCommon extends StatelessWidget {
  final Color? color;
  final double radius;
  final Widget? child;

  CardCommon({this.child, this.color, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
