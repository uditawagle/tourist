import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/classs/pavilions.dart';
import 'package:tourguide/components/detailshotel.dart';
import 'package:tourguide/database.dart';
import 'package:tourguide/pages/booking.dart';

import '../classs/lastresort.dart';

class GokarnaResort extends StatefulWidget {
  const GokarnaResort({ Key? key }) : super(key: key);

  @override
  State<GokarnaResort> createState() => _GokarnaResortState();
}

class _GokarnaResortState extends State<GokarnaResort> {
  DatabaseService db = DatabaseService();
  List<Gokarna> golist = [];
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

          offset = golist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.golist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Gokarna P in data) {
        golist.add(P);
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
        itemCount: golist.length,
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
                      image: AssetImage("${golist[index].image}"),
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
                      "${golist[index].name}",
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
                        Text("${golist[index].location}", 
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
                      "${golist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${golist[index].description}",
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
                child: Text("${golist[index].title1}",
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
                      text: "${golist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${golist[index].text2}",
                      icon: Icons.spa,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${golist[index].text3}",
                      icon: Icons.airport_shuttle,
                    ),
                     Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${golist[index].text8}",
                        icon: Icons.local_drink,
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
                      text: "${golist[index].text5}",
                      icon: Icons.local_parking,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${golist[index].text6}",
                        icon: Icons.coffee_maker,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${golist[index].text7}",
                        icon: Icons.smoke_free_outlined,
                      ),
                      Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${golist[index].text4}",
                      icon: Icons.pool_outlined,
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
                      "${golist[index].title3}", 
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
                      "${golist[index].title4}", 
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
                      "${golist[index].price}", 
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
                    onPressed: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${golist[index].button}",
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


class EncounterNepalSpa extends StatefulWidget {
  const EncounterNepalSpa({Key? key}) : super(key: key);

  @override
  State<EncounterNepalSpa> createState() => _EncounterNepalSpaState();
}

class _EncounterNepalSpaState extends State<EncounterNepalSpa> {
  DatabaseService db = DatabaseService();
 List<HotelEncounter> elist = [];
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

          offset = elist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.elist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (HotelEncounter P in data) {
        elist.add(P);
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
        itemCount: elist.length,
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
                      image: AssetImage("${elist[index].image}"),
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
                      "${elist[index].name}",
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
                        Text("${elist[index].location}", 
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
                      "${elist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${elist[index].description}",
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
                child: Text("${elist[index].title1}",
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
                      text: "${elist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${elist[index].text2}",
                      icon: Icons.family_restroom,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${elist[index].text3}",
                      icon: Icons.restaurant,
                    ),
                     Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${elist[index].text4}",
                        icon: Icons.coffee_maker,
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
                      text: "${elist[index].text7}",
                      icon: Icons.smoke_free_outlined,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${elist[index].text8}",
                        icon: Icons.airport_shuttle_outlined,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${elist[index].text5}",
                        icon: Icons.spa,
                      ),
                      Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${elist[index].text6}",
                      icon: Icons.local_drink,
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
                      "${elist[index].title3}", 
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
                      "${elist[index].title4}", 
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
                      "${elist[index].price}", 
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
                    onPressed: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${elist[index].button}",
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
  DatabaseService db = DatabaseService();
  List<TigerPokhara> tiglist = [];
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

          offset = tiglist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.tiglist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (TigerPokhara P in data) {
        tiglist.add(P);
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
        itemCount: tiglist.length,
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
                      image: AssetImage("${tiglist[index].image}"),
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
                      "${tiglist[index].name}",
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
                        Text("${tiglist[index].location}", 
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
                      "${tiglist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${tiglist[index].description}",
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
                child: Text("${tiglist[index].title1}",
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
                      text: "${tiglist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${tiglist[index].text2}",
                      icon: Icons.spa,
                    ),
                     Button(
                      colorss:Color.fromARGB(255, 196, 201, 241),
                      text: "${tiglist[index].text7}",
                      icon: Icons.umbrella_sharp,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${tiglist[index].text6}",
                      icon: Icons.local_drink_outlined,
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
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${tiglist[index].text3}",
                      icon: Icons.airport_shuttle,
                    ),
                     Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${tiglist[index].text4}",
                        icon: Icons.pool,
                     ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${tiglist[index].text5}",
                        icon: Icons.family_restroom,
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
                      "${tiglist[index].title3}", 
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
                      "${tiglist[index].title4}", 
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
                      "${tiglist[index].price}", 
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
                    onPressed: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${tiglist[index].button}",
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


class GatewayResort extends StatefulWidget {
  const GatewayResort({ Key? key }) : super(key: key);

  @override
  State<GatewayResort> createState() => _GatewayResortState();
}

class _GatewayResortState extends State<GatewayResort> {
  DatabaseService db = DatabaseService();
  List<Gatewayy> gatelist = [];
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

          offset = gatelist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.gatelist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Gatewayy P in data) {
        gatelist.add(P);
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
        itemCount: gatelist.length,
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
                      image: AssetImage("${gatelist[index].image}"),
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
                      "${gatelist[index].name}",
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
                        Text("${gatelist[index].location}", 
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
                      "${gatelist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${gatelist[index].description}",
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
                child: Text("${gatelist[index].title1}",
                style: GoogleFonts.nunito(
                  fontSize: 21,
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
                      colorss:Color.fromARGB(255, 196, 201, 241),
                      text: "${gatelist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${gatelist[index].text2}",
                        icon: Icons.coffee_maker,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${gatelist[index].text3}",
                        icon: Icons.umbrella,
                      ),
                      Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${gatelist[index].text4}",
                      icon: Icons.pool,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${gatelist[index].text5}",
                      icon: Icons.local_drink_sharp,
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
                      "${gatelist[index].title3}", 
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
                      "${gatelist[index].title4}", 
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
                      "${gatelist[index].price}", 
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
                    onPressed: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${gatelist[index].button}",
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


class GrandShambala extends StatefulWidget {
  const GrandShambala({Key? key}) : super(key: key);

  @override
  State<GrandShambala> createState() => _GrandShambalaState();
}

class _GrandShambalaState extends State<GrandShambala> {
  DatabaseService db = DatabaseService();
  List<Shambala> shlist = [];
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

          offset = shlist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.shlist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Shambala P in data) {
        shlist.add(P);
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
        itemCount: shlist.length,
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
                      image: AssetImage("${shlist[index].image}"),
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
                      "${shlist[index].name}",
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
                        Text("${shlist[index].location}", 
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
                      "${shlist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${shlist[index].description}",
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
                child: Text("${shlist[index].title1}",
                style: GoogleFonts.nunito(
                  fontSize: 21,
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
                      colorss:Color.fromARGB(255, 196, 201, 241),
                      text: "${shlist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${shlist[index].text2}",
                        icon: Icons.family_restroom,
                      ),
                      Button(
                      colorss:Color.fromARGB(255, 196, 201, 241),
                      text: "${shlist[index].text3}",
                      icon: Icons.restaurant,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${shlist[index].text4}",
                        icon: Icons.local_drink,
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
                      "${shlist[index].title3}", 
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
                      "${shlist[index].title4}", 
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
                      "${shlist[index].price}", 
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
                    onPressed: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${shlist[index].button}",
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
  