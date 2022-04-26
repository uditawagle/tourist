import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/classs/karnali.dart';
import 'package:tourguide/classs/lastresort.dart';
import 'package:tourguide/classs/pavilions.dart';
import 'package:tourguide/components/detailshotel.dart';
import 'package:tourguide/database.dart';
import 'package:tourguide/pages/booking.dart';

class Pavilions extends StatefulWidget {
  const Pavilions({ Key? key }) : super(key: key);

  @override
  State<Pavilions> createState() => _PavilionsState();
}

class _PavilionsState extends State<Pavilions> {  
  DatabaseService db = DatabaseService();
  List<Pavilion> plist = [];
  ScrollController _controllerr = new ScrollController();

  int offset = 0;

  int currentDataLength = 0;

  @override
  void initState() {
    super.initState();
    fetch(offset);
    _controllerr.addListener(() {
      if (_controllerr.position.pixels == _controllerr.position.maxScrollExtent) {
        if (currentDataLength >= 10) {
          print("List bigger than 10");

          offset = plist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.plist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Pavilion P in data) {
        plist.add(P);
      }
    });
  }

  @override
  void dispose() {
    _controllerr.dispose();
    super.dispose();
  }


  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _controllerr,
        itemCount: plist.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${plist[index].image}"),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${plist[index].name}",
                      style: GoogleFonts.nunito(
                          fontSize: 31,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 17),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${plist[index].location}", 
                        style: TextStyle(
                          fontSize: 17, 
                          color: Colors.brown,
                        ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${plist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${plist[index].description}",
                        style: GoogleFonts.nunito( fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${plist[index].title1}",
                style: GoogleFonts.nunito(
                  fontSize: 21,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 23, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: "${plist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${plist[index].text2}",
                      icon: Icons.ac_unit_rounded,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${plist[index].text3}",
                      icon: Icons.restaurant,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${plist[index].text4}",
                      icon: Icons.pool,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss:Color.fromARGB(255, 145, 233, 148),
                      text: "${plist[index].text5}",
                      icon: Icons.car_rental,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 114, 195, 233),
                        text: "${plist[index].text6}",
                        icon: Icons.airport_shuttle,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${plist[index].text7}",
                        icon: Icons.family_restroom,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${plist[index].text8}",
                        icon: Icons.local_drink_outlined,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 24, right: 15),
                child: Row(
                  children: [
                    Text(
                      "${plist[index].title3}", 
                    style: GoogleFonts.nunito( 
                    fontSize: 18, 
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 29, 46),
                    ),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      "${plist[index].title4}", 
                    style: GoogleFonts.nunito( 
                    fontSize: 18, 
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 29, 46),
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 8, top:3),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        SizedBox(
                          width: 9,
                        ),
                        Text('5'),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text( 
                      "${plist[index].price}", 
                    style: GoogleFonts.nunito( 
                    fontSize: 18, 
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 29, 46),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60
              ),
              Center(
                child: Container(
                  height: 55,
                  child: MaterialButton(
                    minWidth: 220,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${plist[index].button}",
                      style: GoogleFonts.nunito(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20
              ),
            ],
          ),
        ),
      );
        },
      ),
    );
  }
}




class LastResort extends StatefulWidget {
  const LastResort({ Key? key }) : super(key: key);

  @override
  State<LastResort> createState() => _LastResortState();
}

class _LastResortState extends State<LastResort> {
   DatabaseService db = DatabaseService();
 List<ResortLast> rlist= [];
  ScrollController _controllerr = new ScrollController();

  int offset = 0;

  int currentDataLength = 0;

  @override
  void initState() {
    super.initState();
    fetch(offset);
    _controllerr.addListener(() {
      if (_controllerr.position.pixels == _controllerr.position.maxScrollExtent) {
        if (currentDataLength >= 10) {
          print("List bigger than 10");

          offset = rlist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.rlist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (ResortLast P in data) {
        rlist.add(P);
      }
    });
  }

  @override
  void dispose() {
    _controllerr.dispose();
    super.dispose();
  }


  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _controllerr,
        itemCount: rlist.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${rlist[index].image}"),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${rlist[index].name}",
                      style: GoogleFonts.nunito(
                          fontSize: 31,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 17),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${rlist[index].location}", 
                        style: TextStyle(
                          fontSize: 17, 
                          color: Colors.brown,
                        ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${rlist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${rlist[index].description}",
                        style: GoogleFonts.nunito( fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${rlist[index].title1}",
                style: GoogleFonts.nunito(
                  fontSize: 21,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 23, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: "${rlist[index].text1}",
                      icon: Icons.spa,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${rlist[index].text2}",
                      icon: Icons.restaurant,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${rlist[index].text3}",
                      icon: Icons.coffee,
                    ),
                     Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${rlist[index].text8}",
                        icon: Icons.wifi,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss:Color.fromARGB(255, 196, 201, 241),
                      text: "${rlist[index].text5}",
                      icon: Icons.car_rental,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${rlist[index].text6}",
                        icon: Icons.smoke_free_outlined,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${rlist[index].text7}",
                        icon: Icons.local_drink_outlined,
                      ),
                      Button(
                      colorss: Color.fromARGB(255, 241, 216, 216),
                      text: "${rlist[index].text4}",
                       icon: Icons.sports,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 24, right: 15),
                child: Row(
                  children: [
                    Text(
                      "${rlist[index].title3}", 
                    style: GoogleFonts.nunito( 
                    fontSize: 18, 
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 29, 46),
                    ),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      "${rlist[index].title4}", 
                    style: GoogleFonts.nunito( 
                    fontSize: 18, 
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 29, 46),
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 8, top:3),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.grey, size: 20),
                        SizedBox(
                          width: 9,
                        ),
                        Text('4'),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text( 
                      "${rlist[index].price}", 
                    style: GoogleFonts.nunito( 
                    fontSize: 18, 
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 29, 46),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60
              ),
              Center(
                child: Container(
                  height: 55,
                  child: MaterialButton(
                    minWidth: 220,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${rlist[index].button}",
                      style: GoogleFonts.nunito(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20
              ),
            ],
          ),
        ),
      );
        },
      ),
    );
  }
}



class MountainPokhara extends StatefulWidget {
  const MountainPokhara({ Key? key }) : super(key: key);

  @override
  State<MountainPokhara> createState() => _MountainPokharaState();
}

class _MountainPokharaState extends State<MountainPokhara> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$500",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 60,
              child: MaterialButton(
                minWidth: 220,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xff3C4657),
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hotel/tigermountain.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 133, 147, 151),
                                borderRadius: BorderRadius.circular(12)),
                            width: 55,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiger Mountain Pokhara Lodge',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Review: 5'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 23),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Lekhnath, Pokhara', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Place Description",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "Offering an outdoor swimming pool, a lush green garden and a terrace, Tiger Mountain Pokhara Lodge is located in Pokhara. The elegant accommodation will provide you with a balcony, desk and a seating area. Featuring a shower, private bathroom also comes with bathrobes. \nOther facilities offered at the property include a shared lounge, a ticket service and a tour desk. A range of walks by expert guides are available. ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Facilities:',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Free Wifi',
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: 'Spa and wellness Centre',
                      icon: Icons.spa,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Airport Shuttle',
                      icon: Icons.airport_shuttle,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: 'Swimming Pool',
                      icon: Icons.pool_outlined,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss:Color.fromARGB(255, 145, 233, 148),
                      text: 'Family Room',
                      icon: Icons.family_restroom,
                    ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink_outlined,
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Terrace',
                        icon: Icons.umbrella_sharp,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class TigerTopsTharuLodge extends StatefulWidget {
  const TigerTopsTharuLodge({ Key? key }) : super(key: key);

  @override
  State<TigerTopsTharuLodge> createState() => _TigerTopsTharuLodgeState();
}

class _TigerTopsTharuLodgeState extends State<TigerTopsTharuLodge> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 60,
              child: MaterialButton(
                minWidth: 220,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xff3C4657),
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hotel/tigerlodge.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 133, 147, 151),
                                borderRadius: BorderRadius.circular(12)),
                            width: 55,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiger Tops Tharu Lodge',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.white, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Review: 4'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 23),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Chilha, Chitwan', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Place Description",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "Situated 4 km from the scenic Chitwan National Park, Tiger Tops Tharu Lodge offers free WiFi access and a spacious garden. The resort also features a 24-hour front desk and a games room. Each of the rooms comes equipped with a seating area and a private bathroom with slippers for guest use. Popular activities in the surrounding area include hiking, rafting and fishing.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Facilities:',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        colorss: Color.fromARGB(255, 114, 195, 233),
                        text: 'Swimming Pool',
                        icon: Icons.pool
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink_outlined,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GokarnaResort extends StatefulWidget {
  const GokarnaResort({ Key? key }) : super(key: key);

  @override
  State<GokarnaResort> createState() => _GokarnaResortState();
}

class _GokarnaResortState extends State<GokarnaResort> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$144",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 60,
              child: MaterialButton(
                minWidth: 220,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xff3C4657),
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hotel/gokarna.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 133, 147, 151),
                                borderRadius: BorderRadius.circular(12)),
                            width: 55,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gokarna Forest Resort',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Review: 5'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 23),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Rajnikunj Gokarna, Kathmandu', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Place Description",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "Gokarna Forest Resort offers accommodation with breathtaking views of the Gokarna Forest. It features a spa and health club, an 18-hole golf course and 4 dining options. Fitted with tiled or wooden flooring, spacious rooms feature large windows and Nepali-style decoration. They offer a TV with cable channels and a large modern bathroom. Tea/coffee making facilities and a minibar are included. Internet access is available at a fee. \nGuests can swim in Gokarna’s indoor pool or exercise in the gym. Breakfast is served at the Durbur Restaurant, which also offers all-day dining. Club House Restaurant offers Chinese and Thai cuisine by the golf course. Drinks are available at the Pool Bar. ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Facilities:',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Free Wifi',
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: 'Spa and wellness Centre',
                      icon: Icons.spa,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Airport Shuttle',
                      icon: Icons.airport_shuttle,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: 'Swimming Pool',
                      icon: Icons.pool_outlined,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss:Color.fromARGB(255, 145, 233, 148),
                      text: 'Free Parking',
                      icon: Icons.local_parking
                    ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Coffee Maker',
                        icon: Icons.coffee_maker,
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Non-smoking \nRooms',
                        icon: Icons.smoke_free_outlined,
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink_sharp,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TulajaHotel extends StatefulWidget {
  const TulajaHotel({ Key? key }) : super(key: key);

  @override
  State<TulajaHotel> createState() => _TulajaHotelState();
}

class _TulajaHotelState extends State<TulajaHotel> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$13",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 60,
              child: MaterialButton(
                minWidth: 220,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xff3C4657),
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hotel/Tulaja.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 133, 147, 151),
                                borderRadius: BorderRadius.circular(12)),
                            width: 55,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tulaja Boutique Hotel',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.white, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Review: 4'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 23),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Balakhu, Bhaktapur', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Place Description",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "Tulaja Boutique Hotel is located in Bhaktapur. The cosy and comfortable rooms feature clothes rack. Private bathroom also comes with free toiletries. Extras include bed linen, ironing facilities and a fan. Room service is available for in-room dining comforts. \nAt Tulaja Boutique Hotel you will find an airport shuttle, a 24-hour front desk and a garden. The property offers free parking.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Facilities:',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Free Wifi',
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Airport Shuttle',
                      icon: Icons.airport_shuttle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GatewayResort extends StatefulWidget {
  const GatewayResort({ Key? key }) : super(key: key);

  @override
  State<GatewayResort> createState() => _GatewayResortState();
}

class _GatewayResortState extends State<GatewayResort> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$55",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 60,
              child: MaterialButton(
                minWidth: 220,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xff3C4657),
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hotel/marsyandi.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 133, 147, 151),
                                borderRadius: BorderRadius.circular(12)),
                            width: 55,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gateway Himalaya Resort',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.white, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Review: 4'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 23),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Ghanpokhara, Lamjung', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Place Description",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "Gateway Himalaya Resort features a bar, garden and terrace. Among the facilities of this property are a restaurant, a 24-hour front desk and room service, along with free WiFi throughout the property. The accommodation provides an ATM, a concierge service and currency exchange for guests. \nAt the hotel each room is equipped with air conditioning, a desk, a balcony with a lake view, a private bathroom, a flat-screen TV, bed linen and towels. Guest rooms will provide guests with a wardrobe and a kettle.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Facilities:',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Free Wifi',
                      icon: Icons.wifi,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Coffee Maker',
                        icon: Icons.coffee_maker,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Terrace',
                        icon: Icons.umbrella,
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Pool',
                        icon: Icons.pool,
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink_sharp,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManakamanaResort extends StatefulWidget {
  const ManakamanaResort({ Key? key }) : super(key: key);

  @override
  State<ManakamanaResort> createState() => _ManakamanaResortState();
}

class _ManakamanaResortState extends State<ManakamanaResort> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$24",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 60,
              child: MaterialButton(
                minWidth: 220,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xff3C4657),
                child: Text(
                  "Book Now",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hotel/manakamana.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 133, 147, 151),
                                borderRadius: BorderRadius.circular(12)),
                            width: 55,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manakamana Fulbari Resort',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.white, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Review: 4'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 23),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Manakamana, Gorkha', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Place Description",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "Manakamana Fulbari Resort provides a bar. Featuring a 24-hour front desk, this property also provides guests with a restaurant. The hotel features family rooms. At the hotel, each room comes with a wardrobe, a flat-screen TV and a private bathroom.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Facilities:',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 50, 17, 56),
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 13, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Free Wifi',
                      icon: Icons.wifi,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Food',
                        icon: Icons.restaurant
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Room Service',
                        icon: Icons.room_service
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Family Rooms',
                        icon: Icons.family_restroom,
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink_sharp,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
