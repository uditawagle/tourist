import 'package:flutter/material.dart';
import 'package:tourguide/worldclock.dart/time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Color? bgColor;
  Map data = {};

  List<WorldTime> locations = [
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'sydney.jpg'),
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'kathmandu.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'greece.png'),
    WorldTime(url: 'Pacific/Galapagos', location: 'Galapagos', flag: 'galapagos.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'madrid.png'),
    WorldTime(url: 'Atlantic/Bermuda', location: 'Bermuda', flag: 'bermuda.png'),
    WorldTime(url: 'Antarctica/Davis', location: 'Davis', flag: 'davis.png'),
    WorldTime(url: 'America/Argentina/Rio_Gallegos', location: 'Argentina-Rio_Gallegos', flag: 'Río_Gallegos_Bandera.jpg'),
    WorldTime(url: 'America/New_York', location: 'New york', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'istanbul.jpg'),
    WorldTime(url: 'Australia/Adelaide', location: 'Adelaide', flag: 'australia.jpg'),
   
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    bgColor = data['isDayTime'] ? Colors.blueGrey : Colors.indigo[700];
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/world/${locations[index].flag}"),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
