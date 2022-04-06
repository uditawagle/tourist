import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourguide/components/hotels.dart';
import 'package:tourguide/pages/about_us.dart';
import 'package:tourguide/pages/contact_us.dart';
import 'package:tourguide/pages/destination.dart';
import 'package:tourguide/pages/feedback.dart';
import 'package:tourguide/pages/maplocation.dart';
import 'package:tourguide/pages/userpage.dart';
import 'package:tourguide/pages/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
       // elevation: 0,
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/logo/back.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          child: Padding(
            padding: const EdgeInsets.only(top: 90, left: 50, right: 50),
            child: Column(
              children: [
                ImageWidget(
                  title: 'Destination',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Destination()),
                    );
                  },
                  image: NetworkImage(
                    'https://iso.500px.com/wp-content/uploads/2015/08/travel_cover-1500x1000.jpeg',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ImageWidget(
                  title: 'Hotels and \nRestaurant',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hotels()),
                    );
                  },
                  image: NetworkImage(
                    'https://th.bing.com/th/id/R.abe2c2df7a16901479a04158465e94a5?rik=WccExSdtFpDmMg&pid=ImgRaw&r=0',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ImageWidget(
                  title: 'Weather',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoadingScreen()),
                    );
                  },
                  image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.MQnnMuYXiUHg9yB3XqBgeQHaEK?pid=ImgDet&rs=1',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ImageWidget(
                  title: 'Location',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapSample()),
                    );
                  },
                  image: NetworkImage(
                    'https://th.bing.com/th/id/R.7023d1bccddb34c15efec8519eab289c?rik=%2fW5W%2fEQS4pFwLg&riu=http%3a%2f%2f542partners.com.au%2fwp-content%2fuploads%2f2015%2f07%2fmaps-local-search1-ss-1920.jpg&ehk=Te%2fZ3Wqs%2f3aTlsK6REP7cxIJo%2b7YbD6sOqjUMIxqVdg%3d&risl=&pid=ImgRaw&r=0',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ImageWidget(
                  title: 'About Us',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                  image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.sFYVBBWq5lOIdUQ0cH32kAHaD0?pid=ImgDet&rs=1',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ImageWidget(
                  title: 'Feedback',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackScreen()),
                    );
                  },
                  image: NetworkImage(
                    'https://p0.pikrepo.com/preview/227/148/people-communicating-speech-bubbles.jpg',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ImageWidget(
                  title: 'Contact Us',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contact()),
                    );
                  },
                  image: NetworkImage(
                    'https://th.bing.com/th/id/R.7b6fe5ff0e92ddad19dca8d1723b79f9?rik=QTJmaalKeYwyZg&pid=ImgRaw&r=0',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Material(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('umi'),
                accountEmail: Text('umi@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              Newlist(
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                title: 'Home',
                icon: Icons.home,
              ),
              Newlist(
                press: () {},
                title: 'Weather',
                icon: Icons.dashboard,
              ),
              Divider(
                color: Colors.black,
              ),
              Newlist(
                press: () {},
                title: 'Setting',
                icon: Icons.settings_remote,
              ),
              Newlist(
                press: () {},
                title: 'About Us',
                icon: Icons.help,
              ),
              Newlist(
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Body(),
                    ),
                  );
                },
                title: 'Logout',
                icon: Icons.outbox,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final VoidCallback onpress;

  ImageWidget(
      {required this.title, required this.image, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: image,
            //colorFilter: ColorFilters.greyscale,
            child: InkWell(
              onTap: onpress,
            ),
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}

const kPrimaryColor = Color(0xFFfabe66);
const KBgColor = Color(0xFFf2ebe5);

class Newlist extends StatelessWidget {
  const Newlist({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  final hoverColor = Colors.grey;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      hoverColor: hoverColor,
      leading: Icon(
        icon,
        color: kPrimaryColor,
      ),
      onTap: press,
    );
  }
}
