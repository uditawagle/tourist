import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/components/bhaktapurr.dart';
import 'package:tourguide/components/everest.dart';

class Destination extends StatefulWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'Explore Places 🕵 \nWhere do you wanna go??',
                    style: GoogleFonts.akayaTelivigala(
                      fontSize: 40,
                      color: Color.fromARGB(255, 49, 45, 109),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Firstbutton(title: 'Recommended one:'),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/Everest.jpg',
                        text: 'Mount Everest',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EverestDetail()),
                          );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/dhudhpokhari.jpg',
                        text: 'Dudhpokhari',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/temple.jpg',
                        text: ' Pashupatinath \nTemple',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/Mustang.jpg',
                        text: 'Mustang',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                        images: 'assets/travel/langtang.jpg',
                        text: 'Langtang \nNational \nPark',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                        images: 'assets/travel/gosaikunda.jpg',
                        text: ' Gosaikunda \nLake',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/Basecamp.jpg',
                        text: 'Annapurna \nBase Camp',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/sarangkot.jpg',
                        text: 'Sarangkot',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/bhaktapurr.jpg',
                        text: ' Bhaktapur \nDurbar \nSquare ',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BhaktapurDetail()),
                          );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/Gausahar.jpg',
                        text: 'Lamjung \nGausahar',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DestinationDetail()),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Firstbutton(title: 'Mountains:'),
                SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/kanchenjunga.jpg',
                        text: 'Mt. \nKanchenjunga',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/lhotse.jpg',
                        text: 'Mt. Lhotse',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/makalu.jpg',
                        text: 'Mt. Makalu',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/Everest.jpg',
                        text: 'Mt. Mount \nEverest',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/chooyu.jpg',
                        text: 'Mt. Cho Oyu',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/dhaulagiri.jpg',
                        text: ' Mt. \nDhaulagiri',
                        press: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Firstbutton(title: 'Temple Area:'),
                SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/changu.jpg',
                        text: 'Changu \nNarayan \nTemple',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/manakamana.jpg',
                        text: ' Manakamana \nTemple',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/dakshinkali.jpg',
                        text: ' Dakshinkali \nTemple',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/temple.jpg',
                        text: ' Pashupatinath \nTemple',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/guhyeshwari.jpg',
                        text: '  Guhyeshwari \nTemple',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/budhanilkantha.jpg',
                        text: ' Budhanilkantha \nTemple',
                        press: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Firstbutton(title: 'Bungee Jumping:'),
                SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/bhotekhosi.jpg',
                        text: 'Bhote \nKoshi Gorge \nBungee',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/pokharabungee.jpg',
                        text: 'Pokhara \nBungee Jump \nSafety',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/kushmabungee.jpg',
                        text: 'Kusma \nBungee \nJump',
                        press: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Firstbutton(title: 'Jungle Safari:'),
                SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/chitwan.jpg',
                        text: 'Chitwan \nNational \nPark.',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/bardiya.jpg',
                        text: 'Bardiya \nNational \nPark.',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/koshi.jpg',
                        text: 'Koshi \nTappu \nWildlife \nReserve.',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/parsa.jpg',
                        text: 'Parsa \nWildlife \nReserve',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/sheyphoksundo.jpg',
                        text: 'Shey-Phoksundo \nNational \nPark',
                        press: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Firstbutton(title: 'Rafting:'),
                SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/setirafting.jpg',
                        text: 'Upper \nSeti \nRiver \nRafting \nTour',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/karnali.jpg',
                        text: 'Karnali \nRiver \nRafting \nTour',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/marshyangdi.jpg',
                        text: 'Marshyangdi \nRiver \nRafting \nTour',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/sunkosi.jpg',
                        text: 'Sun Kosi \nRiver \nRafting \nTour',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/trisuli.jpg',
                        text: 'Trisuli \nRiver \nRafting \nTour',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/bhotekoshi.jpg',
                        text: 'Bhote \nKoshi \nRiver \nRafting \nTour',
                        press: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Firstbutton(title: 'Trekking Area:'),
                SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/poonhill.jpg',
                        text: 'Ghorepani \nPoon Hill \nTrek',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/langtangtrek.jpg',
                        text: 'Langtang \nValley \nTrek',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/manaslu.jpg',
                        text: 'Manaslu \nCircuit \nTrek',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/mustangtrek.jpg',
                        text: 'Upper \nMustang \nTrek',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/gokyo.jpg',
                        text: 'Gokyo \nLakes \nTrek',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/narphu.jpg',
                        text: 'Nar Phu \nValley \nTrek',
                        press: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Firstbutton(title: 'Lake Area:'),
                SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImagePlace(
                        images: 'assets/travel/panchpokhari.jpg',
                        text: 'Panch \nPokhari \nLake',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/rara.jpg',
                        text: 'Rara Lake',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/sheypokshundo.jpg',
                        text: 'Shey-Pokshundo \nLake',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/tiliho.jpg',
                        text: 'Tilicho \nLake',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/phewa.jpg',
                        text: 'Phewa \nLake',
                        press: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePlace(
                        images: 'assets/travel/gosaikunda.jpg',
                        text: 'Gosaikunda \nLake',
                        press: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePlace extends StatelessWidget {
  final String images;
  final String text;
  final VoidCallback press;

  const ImagePlace(
      {required this.images, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              images,
            ),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: press,
              child: Text(
                text,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Firstbutton extends StatelessWidget {
  final String title;
  // final VoidCallback press;

  Firstbutton({required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.purple,
      ),
      child: Text(title,
          style: GoogleFonts.exo2(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 16)),
    );
  }
}
