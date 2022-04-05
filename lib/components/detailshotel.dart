import 'package:flutter/material.dart';

class HotelYakYeti extends StatefulWidget {
  const HotelYakYeti({Key? key}) : super(key: key);

  @override
  State<HotelYakYeti> createState() => _HotelYakYetiState();
}

class _HotelYakYetiState extends State<HotelYakYeti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$67",
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
                      image: AssetImage('assets/hotel/yeti.jpg'),
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
                      'Hotel Yak & Yeti',
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
                        Text('Durbar Marg, Kathmandu', style: TextStyle(fontSize: 24)),
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
                        "The 5-star Hotel Yak & Yeti is housed in a heritage palace in central Kathmandu, surrounded by antique fountains and landscaped gardens. It also has a casino, an outdoor pool, and 2 tennis courts. Parking is free. \nDecorated in beautiful colour palettes, the elegant air-conditioned rooms are equipped with a cable TV and minibar. Some rooms have a personal safe and bathrobes. Certain bathrooms come with a bathtub. \nGuests can head to the beauty salon or exercise at the fitness centre. The hotel also provides a well-equipped business centre, meeting rooms and a tour desk. Laundry and dry cleaning service is available. Drinks can be enjoyed at The Chimney & Pub. We serve Halal meat.",
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
                      text: 'Spa and \nwellness Centre',
                      icon: Icons.spa_sharp,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Food',
                      icon: Icons.restaurant,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: 'Pool',
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
                      text: 'Non-smoking \nrooms',
                      icon: Icons.smoke_free_outlined,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 114, 195, 233),
                        text: 'Airport Shuttle',
                        icon: Icons.airport_shuttle,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: 'Family room',
                        icon: Icons.family_restroom,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$225",
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
                      image: AssetImage('assets/hotel/karnali.jpg'),
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
                      'Tiger Tops Karnali Lodge',
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
                        Text('Bardia, 44600 Bhurkia', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
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
                        "Located in the Baria National Park, Tiger Tops Karnali Lodge delights guests with elephant polo. The 24-hour front desk makes check-in and check-out easy at all hours. Free Wi-Fi is available in all areas. \nThe fan-cooled rooms feature a wardrobe and a seating area. The attached bathroom is equipped with a shower. Guests can head to the garden or the library to unwind. Laundry, dry cleaning and BBQ facilities are available.",
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
                      text: 'Dry Cleaning',
                      icon: Icons.dry_cleaning,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Food',
                      icon: Icons.restaurant,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: 'Garden',
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
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: 'Room',
                        icon: Icons.family_restroom_sharp,
                      ),
                       Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Private Shuttle',
                        icon: Icons.airport_shuttle_outlined,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Parking',
                        icon: Icons.local_parking_outlined,
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

class KathmanduGuest extends StatefulWidget {
  const KathmanduGuest({Key? key}) : super(key: key);

  @override
  State<KathmanduGuest> createState() => _KathmanduGuestState();
}

class _KathmanduGuestState extends State<KathmanduGuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$45",
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
                      image: AssetImage('assets/hotel/kathmanduguest.jpg'),
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
                      'Kathmandu Guest House',
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
                        Text('Thamel, Kathmandu', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
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
                        "Kathmandu Guest House offers affordable accommodation conveniently located in the popular tourist district of Thamel. It features an on-site restaurant and free private parking.Guests can purchase unique jewellery at the hotel’s gift shop or have a beauty treatment at salon. It also has a convenience store and a tour desk that helps with discounted travel arrangements. \nRooms are surrounded by greenery and are fitted with large windows. They come with an en suite bathroom that has hot/cold shower facilities.",
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
                      text: 'Parking',
                      icon: Icons.local_parking,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 114, 195, 233),
                      text: 'Coffee maker \nin all rooms',
                      icon: Icons.coffee,
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
                      text: 'Non-smoking \nrooms',
                      icon: Icons.smoke_free_outlined,
                    ),
                    Button(
                        colorss: Color.fromARGB(255, 114, 195, 233),
                        text: 'Airport Shuttle',
                        icon: Icons.airport_shuttle,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 225, 233, 114),
                        text: 'Family room',
                        icon: Icons.family_restroom,
                      ),
                      Button(
                        colorss: Color.fromARGB(255, 207, 226, 171),
                        text: 'Bar',
                        icon: Icons.local_drink,
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

class HotelHeritage extends StatefulWidget {
  const HotelHeritage({Key? key}) : super(key: key);

  @override
  State<HotelHeritage> createState() => _HotelHeritageState();
}

class _HotelHeritageState extends State<HotelHeritage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$81",
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
                      image: AssetImage('assets/hotel/heritage.jpg'),
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
                      'Hotel Heritage',
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
                        Text('Suryabinayak, 44800 Bhaktapur', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
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
                        "Hotel Heritage is a 7-minute walk from Bhaktapur Durbar Square. Offering air-conditioned rooms, the hotel is equipped with a tour desk and free Wi-Fi. Free private parking is possible on site. The property provides complimentary airport pickup. \nStaff at the 24-hour front desk can assist guests with car rental and laundry services. Meeting facilities are available on site.Rooms are fitted with a satellite TV and seating area. Shower facilities are included in an en suite bathroom.",
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
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Car Rental',
                      icon: Icons.car_rental,
                    ),
                     Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Free Parking',
                      icon: Icons.local_parking_rounded
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: 'Coffee Maker',
                      icon: Icons.coffee_maker,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Bar',
                      icon: Icons.local_drink,
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

class EncounterNepalSpa extends StatefulWidget {
  const EncounterNepalSpa({Key? key}) : super(key: key);

  @override
  State<EncounterNepalSpa> createState() => _EncounterNepalSpaState();
}

class _EncounterNepalSpaState extends State<EncounterNepalSpa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$26",
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
                      image: AssetImage('assets/hotel/ktmhot.jpg'),
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
                      'Hotel Encounter Nepal & Spa',
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
                        Text('Golkupakha, Thamel', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
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
                        "Hotel Encounter Nepal & Spa is located in Thamel, 3.5 km from Syambhunath Stupa. The modern air-conditioned room has a flat-screen cable TV and a seating area. Featuring a shower, private bathroom also comes with free toiletries. Some rooms have a mountain view. \nThe property offers an in-house restaurant serving Indian and Nepalese cuisine. In-room dining is also possible with room service. Guests can get free city maps, or arrange day trips at the tour desk. The front desk operates 24 hours.",
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
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Family Rooms',
                      icon: Icons.family_restroom,
                    ),
                     Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Food',
                      icon: Icons.restaurant,
                    ),
                    Button(
                      colorss: Color.fromARGB(255, 158, 228, 221),  
                      text: 'Coffee Maker',
                      icon: Icons.coffee_maker,
                    ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Bar',
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
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Spa and wellness \ncentre',
                      icon: Icons.spa,
                    ),
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Non-smoking \nRooms',
                      icon: Icons.smoke_free_outlined,
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

class GrandShambala extends StatefulWidget {
  const GrandShambala({Key? key}) : super(key: key);

  @override
  State<GrandShambala> createState() => _GrandShambalaState();
}

class _GrandShambalaState extends State<GrandShambala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$20",
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
                      image: AssetImage('assets/hotel/hotelgrand.jpg'),
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
                      'Hotel Grand Shambala At Muktinath',
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
                        Text('Ranipauwa 33100, Muktinath', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
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
                        " Hotel Grand Shambala features a bar and terrace. Among the facilities of this property are a restaurant, room service and a shared lounge, along with free WiFi throughout the property. The accommodation offers evening entertainment and a tour desk. \nRooms are complete with a private bathroom fitted with bathrobes, while some units at Hotel Grand Shambala also have a seating area.Continental and à la carte breakfast options are available every morning at the accommodation.",
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
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Family Rooms',
                      icon: Icons.family_restroom,
                    ),
                     Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Food',
                      icon: Icons.restaurant,
                     ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Bar',
                      icon: Icons.local_drink,
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

class MeghauliSerai extends StatefulWidget {
  const MeghauliSerai({Key? key}) : super(key: key);

  @override
  State<MeghauliSerai> createState() => _MeghauliSeraiState();
}

class _MeghauliSeraiState extends State<MeghauliSerai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$710",
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
                      image: AssetImage('assets/hotel/taj.jpg'),
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
                      'Meghauli Serai, A Taj Safari',
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
                        Text('Ward no 1 Narayani Nager Palika, Chitwan', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
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
                        "Featuring free WiFi, Meghauli Serai, Chitwan National Park offers accommodation in Meghauli. The accommodation features a spa bath.The accommodation is air conditioned and is equipped with a flat-screen TV with satellite channels. There is a seating and/or dining area in some units. A minibar and kettle are also provided. There is a private bathroom with a bath and bathrobes in every unit. Bed linen is available with views of the river. \nMeghauli Serai, Chitwan National Park also includes a spa centre and outdoor pool. Guests can enjoy a meal at the on-site restaurant, followed by a drink at the bar. The property also offers packed lunches.",
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
                      text: 'Pool',
                      icon: Icons.pool,
                    ),
                    Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Family Rooms',
                      icon: Icons.family_restroom,
                    ),
                     Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Food',
                      icon: Icons.restaurant,
                     ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Bar',
                      icon: Icons.local_drink,
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

class ChitwanResort extends StatefulWidget {
  const ChitwanResort({Key? key}) : super(key: key);

  @override
  State<ChitwanResort> createState() => _ChitwanResortState();
}

class _ChitwanResortState extends State<ChitwanResort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Minimum price per night: \$29",
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
                      image: AssetImage('assets/hotel/forest.jpg'),
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
                      'Chitwan Forest Resort',
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
                        Text('Sauraha, Bachhauli - 2, Chitwan', 
                        style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
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
                        "Offering traditional bungalows situated around a lovely garden, this homely property is located within the tropical landscapes of Chitwan National Park. It provides free Wi-Fi and a restaurant featuring Swiss specialities. \n wide variety of activities like elephant trekking, canoeing and jeep safaris can be arranged at the tour desk. Other amenities include safety deposit boxes and laundry service. Simply furnished rooms come with a private bathroom with heated showers and a mosquito net and can relax in the hammocks hanging around the garden just outside guest rooms.",
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
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Family Rooms',
                      icon: Icons.family_restroom,
                    ),
                     Button(
                      colorss: Color.fromRGBO(145, 233, 148, 1),
                      text: 'Food',
                      icon: Icons.restaurant,
                     ),
                    Button(
                      colorss:  Color.fromARGB(255, 245, 214, 167),
                      text: 'Bar',
                      icon: Icons.local_drink,
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