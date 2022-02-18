import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class About extends StatelessWidget {
  final String _name = "Travel Guide";
  final String _status = "Feel the best experience of your life";
  final String bio =
      "Travel Guide help you to explore beautiful places of Nepal. Nepal is one of beautiful country in world having Mount Everest, the highest mountain peak in the world with various natural resources and the Birthplace of Gautama Buddha-Lumbini. Some of the major tourism activities in Nepal are mountain climbing, trekking, paragliding, rafting. ";
  final String bioo =
      'Our main motive is to attract tourist from different countries and help them to find their destination with promotion of our tourism sector as well as traditions and culture of nepalese peoples and help our country to earn more currencies from this industry.';
  
  Widget _buildCover(Size screenSize) {
    return Container(
      height: 215,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pink.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLogoImage() {
    return Center(
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/first.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80),
            border: Border.all(
              color: Colors.black,
              width: 1,
            )),
      ),
    );
  }

  Widget _buildFullName() {
    return Text(
      _name,
      style: GoogleFonts.martel(
      color: Colors.teal,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      )
    );
  }

  Widget _buildStatus() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _status,
        style: GoogleFonts.dancingScript(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildBio() {
    TextStyle bioTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 16,
    );
    return Container(
      color: Colors.white24,
      padding: EdgeInsets.all(2),
      child: Text(
        bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

   Widget _buildBioo() {
    TextStyle bioTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 16,
    );
    return Container(
      color: Colors.white24,
      padding: EdgeInsets.all(2),
      child: Text(
        bioo,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparators(Size screensize) {
    return Container(
      width: screensize.width / 1.2,
      height: 2,
      color: Colors.black,
      margin: EdgeInsets.only(top: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        _buildCover(screenSize),
        SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: screenSize.height / 5.3,
            ),
            _buildLogoImage(),
            SizedBox(
              height: 2,
            ),
            _buildFullName(),
            _buildStatus(),
            SizedBox(
              height: 10,
            ),
            _buildBio(),
            SizedBox(height: 5,),
            _buildBioo(),
            SizedBox(
              height: 10,
            ),
            _buildSeparators(screenSize),
          ],
        )),
        Positioned(
          top: 20,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.arrow_back, 
              color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
