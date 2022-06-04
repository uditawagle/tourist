import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class TulajaHotel extends StatefulWidget {
  const TulajaHotel({ Key? key }) : super(key: key);

  @override
  State<TulajaHotel> createState() => _TulajaHotelState();
}

class _TulajaHotelState extends State<TulajaHotel> {
  DatabaseService db = DatabaseService();
  List<Tulaja> tlist = [];
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

          offset = tlist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.tlist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Tulaja P in data) {
        tlist.add(P);
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
        itemCount: tlist.length,
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
                      image: AssetImage("${tlist[index].image}"),
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
                      "${tlist[index].name}",
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
                        Text("${tlist[index].location}", 
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
                      "${tlist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${tlist[index].description}",
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
                child: Text("${tlist[index].title1}",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      colorss:Color.fromARGB(255, 196, 201, 241),
                      text: "${tlist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${tlist[index].text2}",
                        icon: Icons.airport_shuttle,
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
                      "${tlist[index].title3}", 
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
                      "${tlist[index].title4}", 
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
                      "${tlist[index].price}", 
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
                      "${tlist[index].button}",
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
  