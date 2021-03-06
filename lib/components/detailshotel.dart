import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/classs/hotelyak.dart';
import 'package:tourguide/classs/karnali.dart';
import 'package:tourguide/classs/ktmguest.dart';
import 'package:tourguide/classs/pavilions.dart';
import 'package:tourguide/database.dart';
import 'package:tourguide/pages/booking.dart';

class HotelYakYeti extends StatefulWidget {
  const HotelYakYeti({Key? key}) : super(key: key);

  @override
  State<HotelYakYeti> createState() => _HotelYakYetiState();
}

class _HotelYakYetiState extends State<HotelYakYeti> {
  DatabaseService db = DatabaseService();
  List<HotelYak> hlist = [];
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

          offset = hlist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.hlist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (HotelYak P in data) {
        hlist.add(P);
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
        itemCount: hlist.length,
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
                      image: AssetImage("${hlist[index].image}"),
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
                      "${hlist[index].name}",
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
                        Text("${hlist[index].location}", 
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
                      "${hlist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${hlist[index].description}",
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
                child: Text("${hlist[index].title1}",
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
                      text: "${hlist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${hlist[index].text2}",
                      icon: Icons.ac_unit_rounded,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${hlist[index].text3}",
                      icon: Icons.restaurant,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${hlist[index].text4}",
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
                      text: "${hlist[index].text5}",
                      icon: Icons.smoke_free_outlined,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 114, 195, 233),
                        text: "${hlist[index].text6}",
                        icon: Icons.airport_shuttle,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${hlist[index].text7}",
                        icon: Icons.family_restroom,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${hlist[index].text8}",
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
                      "${hlist[index].title3}", 
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
                      "${hlist[index].title4}", 
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
                      "${hlist[index].price}", 
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
                        MaterialPageRoute(
                            builder: (context) => BookingScreen()
                            ),
                            );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff3C4657),
                    child: Text(
                      "${hlist[index].button}",
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

class Button extends StatelessWidget {
  final Color colorss;
  final String text;
  final IconData icon;
  
  Button({ required this.colorss, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: colorss,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon,
            size: 40),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}


class KarnaliLodge extends StatefulWidget {
  const KarnaliLodge({Key? key}) : super(key: key);
  
  @override
  State<KarnaliLodge> createState() => _KarnaliLodgeState();
}

class _KarnaliLodgeState extends State<KarnaliLodge> {
 DatabaseService db = DatabaseService();
 List<TopKarnali> klist= [];
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

          offset = klist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.klist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (TopKarnali P in data) {
        klist.add(P);
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
        itemCount: klist.length,
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
                      image: AssetImage("${klist[index].image}"),
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
                      "${klist[index].name}",
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
                        Text("${klist[index].location}", 
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
                      "${klist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${klist[index].description}",
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
                child: Text("${klist[index].title1}",
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
                      text: "${klist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${klist[index].text2}",
                      icon: Icons.dry_cleaning,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${klist[index].text3}",
                      icon: Icons.restaurant,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${klist[index].text4}",
                      icon: Icons.nature,
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
                      text: "${klist[index].text5}",
                      icon: Icons.family_restroom_sharp,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${klist[index].text6}",
                        icon: Icons.airport_shuttle_outlined,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${klist[index].text7}",
                        icon: Icons.local_drink,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${klist[index].text8}",
                        icon: Icons.local_parking_outlined,
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
                      "${klist[index].title3}", 
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
                      "${klist[index].title4}", 
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
                      "${klist[index].price}", 
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
                      "${klist[index].button}",
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

class KathmanduGuest extends StatefulWidget {
  const KathmanduGuest({Key? key}) : super(key: key);

  @override
  State<KathmanduGuest> createState() => _KathmanduGuestState();
}

class _KathmanduGuestState extends State<KathmanduGuest> {
  DatabaseService db = DatabaseService();
 List<KtmGuest> glist= [];
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

          offset = glist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.glist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (KtmGuest P in data) {
        glist.add(P);
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
        itemCount: glist.length,
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
                      image: AssetImage("${glist[index].image}"),
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
                      "${glist[index].name}",
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
                        Text("${glist[index].location}", 
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
                      "${glist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${glist[index].description}",
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
                child: Text("${glist[index].title1}",
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
                      text: "${glist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: "${glist[index].text2}",
                      icon: Icons.spa,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${glist[index].text3}",
                      icon: Icons.local_parking,
                    ),
                     Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: "${glist[index].text8}",
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
                      text: "${glist[index].text5}",
                      icon: Icons.smoke_free_outlined,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 245, 194, 153),
                        text: "${glist[index].text6}",
                        icon: Icons.airport_shuttle_outlined,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: "${glist[index].text7}",
                        icon: Icons.family_restroom,
                      ),
                      Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: "${glist[index].text4}",
                      icon: Icons.coffee_maker,
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
                      "${glist[index].title3}", 
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
                      "${glist[index].title4}", 
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
                      "${glist[index].price}", 
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
                      "${glist[index].button}",
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


class ChitwanResort extends StatefulWidget {
  const ChitwanResort({Key? key}) : super(key: key);

  @override
  State<ChitwanResort> createState() => _ChitwanResortState();
}

class _ChitwanResortState extends State<ChitwanResort> {
   DatabaseService db = DatabaseService();
  List<Forest> flist = [];
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

          offset = flist.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.flist();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Forest P in data) {
        flist.add(P);
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
        itemCount: flist.length,
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
                      image: AssetImage("${flist[index].image}"),
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
                      "${flist[index].name}",
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
                        Text("${flist[index].location}", 
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
                      "${flist[index].title}",
                      style: GoogleFonts.nunito(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                      child: Text(
                        "${flist[index].description}",
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
                child: Text("${flist[index].title1}",
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
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: "${flist[index].text1}",
                      icon: Icons.wifi,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 148, 173, 219),
                      text: "${flist[index].text2}",
                      icon: Icons.family_restroom,
                    ),
                     Button(
                      colorss: Color.fromARGB(255, 233, 145, 149),
                      text: "${flist[index].text3}",
                      icon: Icons.restaurant,
                     ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: "${flist[index].text4}",
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
                      "${flist[index].title3}", 
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
                      "${flist[index].title4}", 
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
                      "${flist[index].price}", 
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
                      "${flist[index].button}",
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
  